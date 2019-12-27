#!/usr/bin/python3
import cgi,cgitb,redis,time
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
    # python 链接redis
    r = redis.Redis(host='192.168.0.105', password='123456',port=6379,decode_responses=True)
    # 获取一个id
    uid = r.incr('uid')
    print(uid)
    # 数据内容存入哈希中
    res = r.hmset('user:'+str(uid),data)
   #用户id记录到list中
    r.rpush('uids',uid) 

    js = """
      <script>
        alert('添加成功')
        location.href = '/cgi-bin/index.py'
      </script>
    """

    print(js)
except:
  print('redis数据库操作失败')

