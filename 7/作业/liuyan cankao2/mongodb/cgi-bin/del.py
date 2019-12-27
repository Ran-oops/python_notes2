#!/usr/bin/env python3
import cgi,cgitb,pymongo
from bson.objectid import ObjectId
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")
print()    



# 接收数据
fs = cgi.FieldStorage()
uid = fs['id'].value
try:
   # python链接mongo
   client = pymongo.MongoClient("192.168.0.105",27017)
   jihe = client.liuyan.user
   #删除数据
   jihe.remove({"_id":ObjectId(uid)})
   js = """
      <script>
      alert('删除成功');
      location.href = '/cgi-bin/index.py';
      </script>
   """
   print(js)
except:
   js = """
      <script>
      alert('删除失败');
      location.href = '/cgi-bin/index.py';
      </script>
   """
   print(js)
