from django.shortcuts import render,HttpResponse
from sendshow.models import Host
import time
# Create your views here.


def sendcode(request):
    sername = request.GET['service']
    print(sername)
    return HttpResponse('准备发布'+sername)


def restart(request):
    server = request.GET['server']
    time.sleep(5)
    return HttpResponse(server+'   重启成功')
