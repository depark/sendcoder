#--*coding:utf-8 *--
#监测服务健康状态

from sendshow.models import Host
from urllib import request
from urllib.error import URLError
from bs4 import BeautifulSoup as BS
from sendcoder.settings import BASE_DIR
import os,configparser
import socket
import threading,multiprocessing
import django
from sendshow.api import *
import smtplib
from email.mime.text import MIMEText
from time import sleep
from config import *

sender = 'liuhua_yang@ssic.cn'
smtpserver = 'smtp.263xmail.com'
username = 'liuhua_yang@ssic.cn'
password = 'huahua1026'
reveiver = '925161259@qq.com'



def check_status(url):
    try:
        rec = request.urlopen(url,timeout=5)
        code = rec.status
        if code == 200 or code == 304:
            return True
        else:
            return False
    except URLError as e:
        return False

def check_url(i,code):
    url = 'http://' + i.ip + ':8080'
    if check_status(url):
        i.status = 2
        i.save()
    else:
        i.status = code
        i.save()

def check_dubbo(ip):
    socket.setdefaulttimeout(3)
    headers = {
        'Authorization':'Basic cm9vdDpyb290',
        'User-Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        'Connection': 'keep - alive',
    }
    try:
        req = request.Request('http://172.16.1.112:8080/dubbo-admin/governance/addresses',headers=headers)
        page = request.urlopen(req,timeout=2)
        pages = page.read().decode('utf-8')
        soup = BS(pages,'html.parser')
        a=soup.select('table[class="list list_dubbo"]')[0].get_text()
        if ip in a:
            return 0
        else:
            #print(ip+' not in dubbo')
            return 1
    except URLError as e:
        return 2

def write_db(i):
    s = check_dubbo(i.ip)
    if s == 0:
        i.status = 2
        i.save()
    elif s == 1:
        check_url(i,code=1)
    elif s == 2:
        check_url(i,code=0)

def auto_start():
    h = Host.objects.exclude(status=2)
    if len(h) != 0:
        for i in h:
            restart_server(i.ip)
            print(i.ip+'  restart')



def thread(m):
    django.setup()
    h = Host.objects.all()
    if m == 't':
        for i in h:
            t=threading.Thread(target=write_db,args=(i,))
            t.start()
    if m == 'm':
        for i in h:
            p = multiprocessing.Process(target=write_db,args=(i,))
            p.start()
    sleep(5)
    #auto_start()



def mail(content):
    # from_addr = input('发件人: ')
    from_addr = username
    # password = input('密码: ')
    passwd = password
    # to_addr = input('收件人: ')
    to_addr = reveiver
    # smtp_server = input('SMTP 服务器: ')
    smtp_server = 'smtp.263xmail.com'
    # subject = input('发件主题: ')
    subject = "警告"
    text = '''
     <table width="800" border="0" cellpadding="0" cellspacing="0">
          <tr>
              <td bgcolor="#CECFAD" height="20" style="font-size:20px;color: red;" >*警告信息
          </tr>
          <tr>
              <td bgcolor="#EFEBDE" height="100" style="font-size:13px">
                     	<P style='font-size: large;'> %s %s down</P>

                </td>
          </tr>
      </table>
     ''' % (content.name,content.ip)
    msg = MIMEText(text, 'html', 'utf-8')
    # msg['From'] = _format_addr('Python爱好者 <%s>' % from_addr)
    msg['From'] = from_addr
    msg['To'] = to_addr
    msg['Subject'] = subject
    print(msg['From'])


    try:
        server = smtplib.SMTP(smtp_server, 25)
        # server.set_debuglevel(1)
        server.starttls()
        server.login(from_addr, passwd)
        server.sendmail(from_addr, [to_addr], msg.as_string())
        server.quit()
        print('邮件发送成功')
    except Exception as e:
        print("发送失败")


