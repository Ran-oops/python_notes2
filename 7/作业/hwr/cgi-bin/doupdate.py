#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()

print("Content-Type: text/html;charset=utf-8")
print()

fs =cgi.FieldStorage()
inputs={}
uid=fs['id'].value
username=fs['username'].value
content=fs['content'].value
inputs['username']=username
inputs['content']=content
#python lianjie redis
r=redis.Redis(host='127.0.0.1',port=6379,decode_responses=True)

res=r.hmset('user:'+uid,inputs)
try:
	result='''
		<script>
			alert("congratulations, you succeed!")
			location.href='/cgi-bin/index.py'
		</script>
	'''
	print(result)
except:
	result='''
		<script>
			alert('what a pity, you failed!')
		</script>
	'''
	print(result)