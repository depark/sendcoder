# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-07-24 07:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sendshow', '0002_auto_20170724_1511'),
    ]

    operations = [
        migrations.AlterField(
            model_name='service',
            name='type',
            field=models.IntegerField(choices=[(0, '应用'), (1, '服务')], max_length=20, verbose_name='服务还是应用'),
        ),
    ]