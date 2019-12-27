#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()

print("Content-Type: text/html;charset=utf-8")
print()

#jieshou shuju
fs =cgi.FieldStorage()
data={}
for key in fs.keys():
	data[key]=fs[key].value


	#python lian jie redis
r =redis.Redis(host='127.0.0.1',port=6379,decode_responses=True)
#huoqu yige zizeng de id
uid=r.incr('uid')
print(uid)

#shujucunru hash 
res=r.hmset('user:'+str(uid),data)

#jiangshuju id cunru list
r.rpush('uids',uid)
js=''
js="""
	<script>
		alert('congratulations! data is successfully inserted!')
		location.href='/cgi-bin/index.py'
	</script>
"""
print(js)

#except:
#	print('redis shujuku caozuo shibai')
