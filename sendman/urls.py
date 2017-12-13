


from django.conf.urls import url,include
from sendman import maviews


urlpatterns = [
    url(r'^(?P<id>[0-9]+)$',maviews.index,name='manindex'),
    url(r'^sendcode/', maviews.sendcode, name='sendcode'),
    url(r'^restart/', maviews.restart),
    url(r'check/', maviews.check),
    url(r'update/', maviews.update),
    url(r'manage/', maviews.show_host),
    url("^all",maviews.show_host),
]