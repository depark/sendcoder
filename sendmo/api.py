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


cpu = """echo `cat /proc/cpuinfo | grep 'model name' | awk -F ':' '{print $2}' | uniq`*`cat /proc/cpuinfo | grep processor  | wc -l`"""
mem = """free -m | grep Mem | awk -F ' ' '{printf "%.2fG/%.2fG/%.2fG", $2/1024,$3/1024,$4/1024}'"""
disk = """lsblk | grep disk | gawk '{print $1,$4}'"""
system = """cat /etc/redhat-release """



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

def check_dubbo(ip,dubbo_ip):
    socket.setdefaulttimeout(3)
    headers = {
        'Authorization':'Basic cm9vdDpyb290',
        'User-Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        'Connection': 'keep - alive',
    }
    try:
        req = request.Request('http://{dubbo_ip}:8080/dubbo-admin/governance/addresses'.format(dubbo_ip=dubbo_ip),headers=headers)
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

def write_db(i,dubbo_ip):
    print('start to check dubbo ip:{ip} and dubbo:{dubbo}'.format(ip=i.ip,dubbo=dubbo_ip))
    s = check_dubbo(i.ip,dubbo_ip)
    if s == 0:
        i.status = 2
        i.save()
    else:
        i.status = 1
        i.save()





def auto_start():
    h = Host.objects.exclude(status=2)
    if len(h) != 0:
        for i in h:
            restart_server(i.ip)
            print(i.ip+'  restart')

def thread():
    #检测dubbo健康
    dubbo_health={}
    dubbos=Envi.objects.all()
    for i in dubbos:
        print('start to check '+i.dubbo_ip)
        code = check_dubbo(ip='test',dubbo_ip=i.dubbo_ip)
        if code == 2:
            dubbo_health[i.dubbo_ip]='down'
            return dubbo_health
        #健康检测
        hosts=Envi.objects.get(dubbo_ip=i.dubbo_ip).service_set.all()
        for host in hosts:
            for ip in host.hosts.all():
                p=threading.Thread(target=write_db,args=(ip,i.dubbo_ip))
                p.start()






    phy_host = Host.objects.filter(is_vitual=1)
    for ip in phy_host:
        result = os.system('ping -c 2 '+ip.ip+'>>/dev/null')
        if result:
            ip.status = 2

        else:
            ip.status = 1
        ip.save()
    n = {'status': 0, 'result':  '检测成功'}
    #auto_start()
    return n

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

def update_info(ip):
    host = Host.objects.get(ip=ip)
    if  host.system == 'windows':
        t = {'status': 1, 'result': 'windows主机状态无法检测'}
        return  t
    CPU = run(cpu,ip)
    MEM = run(mem,ip)
    DISK = run(disk,ip)
    ossys = run(system,ip)
    host.cpu = CPU['result'][0]
    host.memory = MEM['result'][0]
    host.disk = str(DISK['result']).replace('[','').replace(']','')
    host.system = ossys['result'][0]

    try:
        host.save()
        t = {'status':0,'result':'更新成功'}
    except Exception as e:
        print(e)
        t = {'status':1,'result':'更新失败'}

    return t
