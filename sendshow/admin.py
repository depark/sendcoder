from django.contrib import admin
from sendshow.models import *


# Register your models here.

class  Host_admin(admin.ModelAdmin):
    list_display = ('id','hostname', 'status','date_added')


class Project_admin(admin.ModelAdmin):
    list_display = ('name','person')


class Service_admin(admin.ModelAdmin):
    list_display = ('name','type')

admin.site.register(Host,Host_admin)
admin.site.register(Project,Project_admin)
admin.site.register(Service,Service_admin)

