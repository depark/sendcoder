from django.shortcuts import render,HttpResponse
from sendshow.models import Host
import time
import json
from sendshow.api import *
# Create your views here.


def sendcode(request):
    sername = request.GET['service']
    sername = sername.strip()
    re = Release(sername)
    print(re)
    return HttpResponse(json.dumps(re))


def restart(request):
    server = request.GET['server']
    try:
        re = restart_server(server)
    except OSError :
        re = {'status': 1, 'result': server+'  连接错误'}
    print(re)
    return HttpResponse(json.dumps(re))
