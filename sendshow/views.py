#--*coding:utf-8 *--
from django.shortcuts import render,render_to_response,HttpResponse
from sendshow.models import *
from sendmo.api import *

# Create your views here.


def post_only(f):
    def wrap_f(request):
        if request.method != 'POST':
            response = HttpResponse('only post')
            response.status_code = 500
            return response
        return f(request)
    return wrap_f




@post_only
def page(request):
    return HttpResponse('发布中....')

def show_index(requets):
    phy = Host.objects.filter(is_vitual=1)
    #return HttpResponse('hello')
    return render_to_response('phy-host.html',locals())

def detial(request,id):
    vituals = []
    server = Host.objects.get(id=id)
    print(server)
    if server.is_vitual == 1 and server.system != 'windows':
        vit = run('virsh list',server.ip)
        vits = vit['result'][2:-1]
        for i in vits:
            a=i.split()
            c=a[1]+'   '+a[2]
            vituals.append(c)
    return render_to_response('detail.html', locals())