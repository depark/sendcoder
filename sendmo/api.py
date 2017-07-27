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

import smtplib
from email.mime.text import MIMEText

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




