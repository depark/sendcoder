from django.shortcuts import render,render_to_response,HttpResponse
from sendshow.models import *
from sendmo.api import *

# Create your views here.



def index(request):
    pro = Service.objects.all().order_by()
    title = 'service list'
    thread(m='t')
    return render_to_response('index.html',locals())


def page(request):
    return HttpResponse('发布中....')