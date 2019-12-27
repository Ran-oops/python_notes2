#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()

print("Content-Type: text/html;charset=utf-8")
print()

fs =cgi.FieldStorage()
uid=fs['id'].value
#print(uid)
try:
	#python lianjie redis
	r=redis.Redis(host='127.0.0.1',port=6379,decode_responses=True)
	r.delete('user:'+uid)
	r.lrem('uids',uid)
	js='''
		<script>
			alert('congratulations!')
			location.href='/cgi-bin/index.py';
		</script>
	'''
	print(js)
except:
	print('error')