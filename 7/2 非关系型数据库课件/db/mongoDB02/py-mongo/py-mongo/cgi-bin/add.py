#!/usr/bin/python3
import cgi,cgitb,pymongo,json
cgitb.enable()

print('Content-type:text/html;charset=utf8')
print()



# 接收数据
fs = cgi.FieldStorage()
data = {}  
for key in fs.keys():  
    data[key] = fs[key].value  



# 链接mongo
client = pymongo.MongoClient('127.0.0.1',27017)

# 选择库
db = client.py5


hjs = """
	<script>
	  alert('添加成功');
     location.href = '/cgi-bin/index.py';
	</script>
"""

   
try:
   db.liuyan.insert(data)
   print(hjs)
except:
   print('error')
 

