from django.db import models

class Users(models.Model):
    name = models.CharField(max_length=32)
    age = models.IntegerField(default=20)
    phone = models.CharField(max_length=16)
    

class District(models.Model):
    name = models.CharField(max_length=255)
    upid = models.IntegerField()

    class Meta:
        db_table = "district"  #指定真实表名