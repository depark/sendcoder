#监测服务健康状态

from sendshow.models import Host
from urllib import request
from urllib.error import URLError
from bs4 import BeautifulSoup as BS
from sendcoder.settings import BASE_DIR
import os,configparser
from config import *
import smtplib

cf = configparser.ConfigParser()
cf.read(os.path.join(BASE_DIR,'config.conf'))
dubbo_url = cf.get('dubbo','dubbo_url')
smtp_server = cf.get('mail','smtpserver')
sender = cf.get('mail','sender')
username = cf.get('mail','username')
password = cf.get('mail','password')
interver = cf.get('mail','interver')



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

def check_dubbo(ip):
    headers = {
        'Authorization':'Basic cm9vdDpyb290',
        'User-Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        'Connection': 'keep - alive',
    }
    try:
        req = request.Request('http://172.16.1.112:8080/dubbo-admin/governance/addresses',headers=headers)
        page = request.urlopen(req)
        pages = page.read().decode('utf-8')
        soup = BS(pages,'html.parser')
        a=soup.select('table[class="list list_dubbo"]')[0].get_text()
        if ip in a:
            return True
        else:
            return False
    except URLError as e:
        return False



def write_db():
    host = Host.objects.all()
    for i in host:
        ip=i.ip
        s = check_dubbo(ip)
        if s:
            i.status = 2
            i.save()
        else:
            url = 'http://'+ip+':8080'
            if check_status(url):
                i.status = 2
                i.save()
            else:
                i.status = 1
                i.save()



