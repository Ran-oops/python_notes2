#!/usr/bin/python3
import cgi,cgitb,pymongo,time
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  




# 接收数据
fs = cgi.FieldStorage()
#将数据存入字典中

data = {}  
for key in fs.keys():  
    data[key] = fs[key].value  
#添加时间信息
wtime = time.strftime('%Y-%m-%d %H:%M:%S')
data["addtime"]=wtime
try:
    # python 链接mongodb,j进入数据库liuyan
    client = pymongo.MongoClient("192.168.0.105",27017)
    db=client.liuyan
    #给user集合中插入文档
    db.user.insert(data)

    js = """
      <script>
        alert('添加成功')
        location.href = '/cgi-bin/index.py'
      </script>
    """

    print(js)
except:
    print('添加数据失败')

