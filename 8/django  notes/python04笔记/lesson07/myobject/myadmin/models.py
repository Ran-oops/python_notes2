from django.db import models

#用户信息模型
class Users(models.Model):
    username = models.CharField(max_length=32)
    name = models.CharField(max_length=16)
    password = models.CharField(max_length=32)
    sex = models.IntegerField(default=1)
    address = models.CharField(max_length=255)
    code = models.CharField(max_length=6)
    phone = models.CharField(max_length=16)
    email = models.CharField(max_length=50)
    state = models.IntegerField(default=1)
    addtime = models.IntegerField()

    def toDict(self):
    	return {'id':self.id,'username':self.username,'name':self.name,'password':self.password}

    class Meta:
        db_table = "myweb_users"  # 更改表名