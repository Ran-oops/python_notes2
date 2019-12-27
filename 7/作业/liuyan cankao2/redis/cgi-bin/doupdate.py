#!/usr/bin/python3
import cgi,cgitb,redis,time
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  

# print("你好,世界")

# 接收数据
fs = cgi.FieldStorage()
inputs = {} 
uid = fs['userid'].value
content = fs['content'].value
wtime = time.strftime('%Y-%m-%d %H:%M:%S')
inputs['content']=content
inputs['addtime']=wtime
try:
    # 执行修改 只需要修改对应的哈希数据 user:11
    # python 链接redis
    r = redis.Redis(host='192.168.0.105',password='123456', port=6379,decode_responses=True)

    res =  r.hmset('user:'+uid,inputs)
    js = """
        <script>
        alert('更新成功');
        location.href = '/cgi-bin/index.py';
        </script>
      """
    print(js)
except:
    print('更新失败')


