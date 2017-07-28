from django.shortcuts import render,render_to_response,HttpResponse
from sendshow.models import *
from sendmo.api import *

# Create your views here.



def index(request):
    pro_ser = Service.objects.all().filter(type=0)
    pro_hand = Service.objects.all().filter(type=1)
    type = Service.objects.all().values('type').distinct()
    title = 'service list'
    #thread(m='t')
    return render_to_response('index.html',locals())


def page(request):
    return HttpResponse('发布中....')