from django.db import models
import time 
# Create your models here.
class Pic(models.Model):
	name = models.CharField(max_length=32)
	age = models.IntegerField()
	picname = models.CharField(max_length=32)
	addtime = models.IntegerField()