from django.db import models

# Create your models here.


ASSET_STATUS = (
    (0,'在用'),
    (1,'闲置'),
)

SERVICE_STATUS = (
    (0,'应用'),
    (1,'服务'),
)


class Host(models.Model):
    '''
    主机列表
    '''

    ip = models.CharField(max_length=32, blank=True, null=True, verbose_name=u"主机IP")
    other_ip = models.CharField(max_length=255, blank=True, null=True, verbose_name=u"其他IP")
    hostname = models.CharField(unique=True, max_length=128, verbose_name=u"主机名")
    port = models.IntegerField(blank=True, null=True, verbose_name=u"端口号")
    username = models.CharField(max_length=16, blank=True, null=True, verbose_name=u"管理用户名")
    password = models.CharField(max_length=256, blank=True, null=True, verbose_name=u"密码")
    system_type = models.CharField(max_length=32, blank=True, null=True, verbose_name=u"系统类型")
    status = models.IntegerField(choices=ASSET_STATUS, blank=True, null=True, default=1, verbose_name=u"机器状态")
    date_added = models.DateTimeField(auto_now=True, null=True)
    is_active = models.BooleanField(default=True, verbose_name=u"是否激活")
    comment = models.CharField(max_length=128, blank=True, null=True, verbose_name=u"备注")


    def __str__(self):
        return self.ip


class Service(models.Model):
    '''
    应用或服务列表
    '''
    name = models.CharField(max_length=50,verbose_name=u'应用/服务名')
    type = models.IntegerField(choices=SERVICE_STATUS,verbose_name='服务还是应用')
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
