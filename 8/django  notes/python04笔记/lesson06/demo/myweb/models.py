from django.db import models
import time
# Create your models here.
class Pic(models.Model):
    name = models.CharField(max_length=32)
    age = models.IntegerField()
    picname = models.CharField(max_length=32)
    addtime = models.IntegerField()

    def picinsert(self,request,filename):
        self.name = request.POST['name']
        self.age = request.POST['age']
        self.picname = filename
        self.addtime= time.time()
        self.save()