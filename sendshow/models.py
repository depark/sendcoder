#--*coding:utf-8 *--
from django.db import models

# Create your models here.


ASSET_STATUS = (
    (0,'未知'),
    (1,'停止'),
    (2,'运行')
)

SERVICE_STATUS = (
    (0,'应用'),
    (1,'服务'),
    (2,'其他'),
)

VIRTUAL = (
    (0,'虚拟机'),
    (1,'物理机'),
)

class Host(models.Model):
    '''
    主机列表
    '''

    ip = models.CharField(max_length=32, unique=True,blank=True, null=False, verbose_name=u"主机IP")
    hostname = models.CharField(unique=True, max_length=128, verbose_name=u"主机名")
    port = models.IntegerField(blank=True, null=True,default=22, verbose_name=u"端口号")
    username = models.CharField(max_length=16, default='root',blank=True, null=True, verbose_name=u"管理用户名")
    password = models.CharField(max_length=256, blank=True, null=True, verbose_name=u"密码")
    cpu = models.CharField(max_length=200,blank=True,null=True,verbose_name='cpu情况')
    memory = models.CharField(max_length=20,blank=True,null=True,verbose_name='内存')
    system = models.CharField(max_length=32,blank=True,null=True, verbose_name=u"系统类型")
    disk = models.CharField(max_length=30,blank=True,null=True,verbose_name='硬盘')
    status = models.IntegerField(choices=ASSET_STATUS,default=0,verbose_name="服务运行状态")
    type = models.IntegerField(choices=SERVICE_STATUS,default=0,verbose_name="服务还是应用")
    date_added = models.DateTimeField(auto_now=True, null=True)
    is_vitual = models.IntegerField(choices=VIRTUAL,verbose_name='虚拟机还是物理机')
    comment = models.CharField(max_length=128, blank=True, null=True, verbose_name=u"备注")



    def __str__(self):
        return self.ip


class Service(models.Model):
    '''
    应用或服务列表
    '''
    name = models.CharField(max_length=50,verbose_name=u'应用/服务名')
    type = models.IntegerField(choices=SERVICE_STATUS,default=0,verbose_name='服务还是应用')
    hosts = models.ManyToManyField(Host,verbose_name=u'主机')


    def __str__(self):
        return self.name

class Project(models.Model):
    '''
    项目
    '''

    name = models.CharField(max_length=50,unique=True,verbose_name=u'项目名')
    type = models.ManyToManyField(Service,verbose_name=u'所拥有的服务')
    person = models.CharField(max_length=30,verbose_name=u'负责人')

    def __str__(self):
        return self.name
