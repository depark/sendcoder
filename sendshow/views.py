from django.shortcuts import render,render_to_response,HttpResponse
from sendshow.models import *


# Create your views here.



def index(request):
    pro = Service.objects.all()
    title = 'service list'
    print('hello world')
    print(pro)
    for i in pro:
        print(i.name)

    return render_to_response('index.html',locals())


def page(request):
    return HttpResponse('发布中....')