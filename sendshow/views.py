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



def index(request):
    pro_ser = Service.objects.all().filter(type=0)
    pro_hand = Service.objects.all().filter(type=1)
    type = Service.objects.all().values('type').distinct()
    title = 'service list'
    #thread(m='t')
    return render_to_response('index.html',locals())

@post_only
def page(request):
    return HttpResponse('发布中....')

#更新硬件信息
def update(request):
    pass

def detial(request,id):
    server = Host.objects.get(id=id)
    return render_to_response('detail.html', locals())