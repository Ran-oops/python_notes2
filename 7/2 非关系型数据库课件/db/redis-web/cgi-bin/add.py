#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  




# 接收数据
fs = cgi.FieldStorage()
data = {}  
for key in fs.keys():  
    data[key] = fs[key].value  



   
try:
    # python 链接redis
    r = redis.Redis(host='127.0.0.1', port=6379,decode_responses=True)

    # 获取一个自增的id
    uid = r.incr('uid')

    # 数据的存入 hash   user:1
    res = r.hmset('user:'+str(uid),data)
   
    #用户id记录到list链表中
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

