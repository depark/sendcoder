from django.shortcuts import render,render_to_response,HttpResponse
from sendshow.models import *
from sendmo.api import write_db

# Create your views here.



def index(request):
    pro = Service.objects.all()
    title = 'service list'
    #write_db()
    return render_to_response('index.html',locals())


def page(request):
    return HttpResponse('发布中....')