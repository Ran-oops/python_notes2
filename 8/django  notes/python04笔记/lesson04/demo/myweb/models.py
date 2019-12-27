from django.db import models

# Create your models here.
# 学生表的model类
class Stu(models.Model):
    name = models.CharField(max_length=16)
    sex = models.CharField(max_length=1)
    age = models.IntegerField(default=20)
    classid = models.CharField(max_length=7)