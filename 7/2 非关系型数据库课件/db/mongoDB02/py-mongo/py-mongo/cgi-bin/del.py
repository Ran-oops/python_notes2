#!/usr/bin/python3
import cgi,cgitb,pymongo
from bson.objectid import ObjectId
cgitb.enable()

print('Content-type:text/html;charset=utf8')
print()



# 接收数据
fs = cgi.FieldStorage()


# 接收id
lid = fs['id'].value



# 链接mongo
client = pymongo.MongoClient('127.0.0.1',27017)

# 选择库
db = client.py5


hjs = """
	<script>
	  alert('删除成功');
     location.href = '/cgi-bin/index.py';
	</script>
"""

   
try:
   # 注意,在执行mongo中的查询或删除时,指定的_id字段后面的 ObejctId方法必须要导入对用的包才能使用 
   # db.liuyan.remove({"_id":"ObjectId("+lid+")"}) # X
   db.liuyan.remove({"_id":ObjectId(lid)})
   print(hjs)
except:
   print('error')
 

