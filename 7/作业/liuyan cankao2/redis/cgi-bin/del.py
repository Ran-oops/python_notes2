#!/usr/bin/env python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  



# 接收数据
fs = cgi.FieldStorage()
uid = fs['id'].value
try:
   # python 链接redis
   r = redis.Redis(host='192.168.0.105', password="123456",port=6379,decode_responses=True)
   #  删除用户数据 的哈希
   r.delete('user:'+uid)
   # #删除用户id  lrem list2 0 "hello" 
   r.lrem('uids',uid)
   js = """
      <script>
      alert('删除成功');
      location.href = '/cgi-bin/index.py';
      </script>
   """
   print(js)
except:
   print('删除失败')

