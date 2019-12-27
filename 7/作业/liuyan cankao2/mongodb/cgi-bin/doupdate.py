#!/usr/bin/python3
import cgi,cgitb,pymongo,time
from bson.objectid import ObjectId
cgitb.enable()

print("Content-Type: text/html;charset=utf-8")    
print()                             



# 接收数据
fs = cgi.FieldStorage()
inputs = {} 
#获取要修改的用户id和内容
uid = fs['userid'].value
cont = fs['content'].value
wtime = str(time.strftime('%Y-%m-%d %H:%M:%S'))
#将内容装进字典
inputs['content']=cont
inputs['addtime']=wtime
try:
    #连接mongo
    client = pymongo.MongoClient("192.168.0.105",27017)
    db = client.liuyan
    #更新数据
    db.user.update({"_id":ObjectId(uid)},{"$set":inputs})
    js = """
        <script>
        alert('更新成功');
        location.href = '/cgi-bin/index.py';
        </script>
      """
    print(js)
except:
    js = """
        <script>
        alert('更新失败');
        location.href = '/cgi-bin/index.py';
        </script>
      """
    print(js)


