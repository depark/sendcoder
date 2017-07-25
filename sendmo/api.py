#监测服务健康状态

from sendshow.models import Host
from urllib import request
from urllib.error import URLError

def check_status(host,url):
    try:
        rec = request.urlopen(url,timeout=5)
        code = rec.status
        if code == 200 or code == 304:
            return True
        else:
            return False
    except URLError as e:
        return False



def write_db():
    host = Host.objects.all()
    for i in host:
        ip=i.ip
        url = i.monitor
        print(len(url))
        if len(url) == 0:
            i.status = 0
            i.save()
            continue
        s = check_status(ip,url)
        print(s)
        if s:
            i.status = 2
            i.save()
        else:
            i.status = 1
            i.save()


