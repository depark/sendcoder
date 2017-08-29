from django.conf.urls import url,include
from sendshow import views


urlpatterns = [
    url(r'^$',views.show_index,name='showphy'),
    url(r'^detial/(?P<id>[0-9]+)', views.detial, name='show_detail'),
]