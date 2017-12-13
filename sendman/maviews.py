from django.shortcuts import render,HttpResponse,render_to_response
from sendshow.models import Host
import time
import json
from sendmo.api import *
from sendshow.api import *
from dwebsocket import *
# Create your views here.


def index(request,id):
    print(id)
    pro_ser = Envi.objects.get(id=id).service_set.filter(type=0)
    pro_hand = Envi.objects.get(id=id).service_set.filter(type=1)
    type = Service.objects.all().values('type').distinct()
    #n = thread('all')
    title = '测试环境'
    #thread(m='t')
    return render_to_response('index.html',locals())




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
    n = thread()
    print(n)
    return HttpResponse(json.dumps(n))


def update(request):
    ip = request.GET['ip']
    print(ip)
    a=update_info(ip)
    return HttpResponse(json.dumps(a))

@require_websocket
def logshow(request):
        print('start to websocket')
        print('websocket')
        message = request.websocket.wait()
        print(message)
        #request.websocket.send('hello')


def show_host(request):
    pass
