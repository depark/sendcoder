"""sendcoder URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from sendshow import views
from sendman import maviews


urlpatterns = [
    url(r'^$',views.index),
    url(r'^sendcode/',maviews.sendcode,name='sendcode'),
    url(r'^restart/',maviews.restart),
     url(r'check/',maviews.check),
    #url(r'^detial/(?P<id>[0-9]+)',views.detial,name='show_detial'),
    url(r'^detial/', views.detial, name='show_detial'),
    url(r'^update/',views.update,name='update'),
    url(r'^page',views.page),
    url(r'^admin/', admin.site.urls),
]
