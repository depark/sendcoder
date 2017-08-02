# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-01 09:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Host',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ip', models.CharField(blank=True, max_length=32, unique=True, verbose_name='主机IP')),
                ('other_ip', models.CharField(blank=True, max_length=255, null=True, verbose_name='其他IP')),
                ('hostname', models.CharField(max_length=128, unique=True, verbose_name='主机名')),
                ('port', models.IntegerField(blank=True, default=22, null=True, verbose_name='端口号')),
                ('username', models.CharField(blank=True, default='root', max_length=16, null=True, verbose_name='管理用户名')),
                ('password', models.CharField(blank=True, max_length=256, null=True, verbose_name='密码')),
                ('cpu', models.CharField(max_length=200, null=True, verbose_name='cpu情况')),
                ('memory', models.CharField(max_length=20, null=True, verbose_name='内存')),
                ('system', models.CharField(max_length=32, null=True, verbose_name='系统类型')),
                ('disk', models.CharField(max_length=30, null=True, verbose_name='硬盘')),
                ('status', models.IntegerField(choices=[(0, '未知'), (1, '停止'), (2, '运行')], default=0, verbose_name='服务运行状态')),
                ('type', models.IntegerField(choices=[(0, '应用'), (1, '服务')], default=0, verbose_name='服务还是应用')),
                ('date_added', models.DateTimeField(auto_now=True, null=True)),
                ('is_vitual', models.IntegerField(choices=[(0, '虚拟机'), (1, '物理机')], verbose_name='虚拟机还是物理机')),
                ('comment', models.CharField(blank=True, max_length=128, null=True, verbose_name='备注')),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True, verbose_name='项目名')),
                ('person', models.CharField(max_length=30, verbose_name='负责人')),
            ],
        ),
        migrations.CreateModel(
            name='Service',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='应用/服务名')),
                ('type', models.IntegerField(choices=[(0, '应用'), (1, '服务')], default=0, verbose_name='服务还是应用')),
                ('hosts', models.ManyToManyField(to='sendshow.Host', verbose_name='主机')),
            ],
        ),
        migrations.AddField(
            model_name='project',
            name='type',
            field=models.ManyToManyField(to='sendshow.Service', verbose_name='所拥有的服务'),
        ),
    ]
