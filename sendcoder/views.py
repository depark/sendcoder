from django.shortcuts import render,render_to_response,HttpResponse
from time import sleep
import json


def index(request):
    return render_to_response('base.html')


def test(request):
    if request.method == 'POST':
        ip = request.POST['ip']
        init_type = request.POST['initname']
        print(ip,init_type)
        sleep(5)
        r = {'success':0}
        return HttpResponse(json.dumps(r))
    return render_to_response('test.html')


def tests(request):
    ip = request.GET['ips']
    ini = request.GET['initname']
    print(ip,ini)
    r = {'success': 0}
    sleep(4)
    return HttpResponse(json.dumps(r))