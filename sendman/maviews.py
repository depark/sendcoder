from django.shortcuts import render,HttpResponse
from sendshow.models import Host
import time
from sendshow.api import *
# Create your views here.


def sendcode(request):
    sername = request.GET['service']

    print(sername)
    return HttpResponse('准备发布'+sername)


def restart(request):
    server = request.GET['server']
    try:
        re = restart_server(server)
    except OSError :
        re = '重启失败'
    return HttpResponse(server+'  '+re)
