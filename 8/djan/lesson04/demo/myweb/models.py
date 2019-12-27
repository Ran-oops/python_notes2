from django.db import models

# Create your models here.
# 学生表的model类
class stu(models.Model):
    name = models.CharField(max_length=16)
    age = models.IntegerField(default=20)
    classid = models.CharField(max_length=7)