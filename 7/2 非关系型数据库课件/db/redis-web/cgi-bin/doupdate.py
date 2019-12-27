#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  

# print("你好,世界")

# 接收数据
fs = cgi.FieldStorage()
inputs = {}  
for key in fs.keys():  
    if key != 'id':
      inputs[key] = fs[key].value  



try:
    # 执行修改 只需要修改对应的哈希数据 user:11
    # python 链接redis
    r = redis.Redis(host='127.0.0.1', port=6379,decode_responses=True)

    res =  r.hmset('user:'+fs['id'].value,inputs)
    js = """
        <script>
        alert('更新成功');

        //跳转
        location.href = '/cgi-bin/index.py';
        </script>
      """

    print(js)

except:

   print('error')


