from django.shortcuts import render,HttpResponse
from sendshow.models import Host
import time
import json
from sendmo.api import *
from sendshow.api import *
from dwebsocket import *
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

    if re['status'] == 0:
        re['result'] = '重启成功'
    print(re)
    return HttpResponse(json.dumps(re))



def check(request):
    ser = request.GET['server']
    n = thread(ser)
    print(n)
    return HttpResponse(json.dumps(n))


def update(request):
    ip = request.GET['ip']
    print(ip)
    a=update_info(ip)
    return HttpResponse(json.dumps(a))

@accept_websocket
def logshow(request):
    if request.is_websocket:
        print('start to websocket')
        print('websocket')
        message = request.websocket
        print(message)
        request.websocket.send('hello')
