from django.contrib import admin
from sendshow.models import *


# Register your models here.

class  Host_admin(admin.ModelAdmin):
    list_display = ('ip','id','hostname','type','port', 'status','date_added')
    readonly_fields = ('status',)
    search_fields = ('ip',)


class Service_admin(admin.ModelAdmin):
    list_display = ('id','name','type')

admin.site.register(Host,Host_admin)
admin.site.register(Service,Service_admin)

