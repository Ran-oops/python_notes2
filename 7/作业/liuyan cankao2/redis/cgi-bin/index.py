#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    
print()                               


# python 链接redis
r = redis.Redis(host='192.168.0.105',password="123456", port=6379,decode_responses=True)
# 获取所有的用户id 
uids = r.lrange('uids',0,-1)
trs = ''
i=0
# 通过用户id找到所有的用户哈希，获取数据
for ids in uids:
	userinfo = r.hvals('user:'+ids)
	i+=1
	trs += """
		<tr>
			<td>{rank}</td>
			<td>{name}</td>
			<td>{content}</td>
			<td>{addtime}</td>
			<td><a href="/cgi-bin/del.py?id={uid}">删除</a>|<a href="/cgi-bin/update.py?id={uid}">修改</a></td>
		</tr>
	""".format(rank=i,name=userinfo[0],content=userinfo[1],addtime=userinfo[2],uid=ids)


html = '''
        <!DOCTYPE html>
        <html>
                <head>
                        <meta charset='utf-8'>
                        <title>留言列表</title>
                        <link href="/public/css/bootstrap.min.css" rel="stylesheet">
    					<script src="/public/js/jquery-1.12.4.min.js"></script>
    					<script src="/public/js/bootstrap.min.js"></script>
                </head>
                <body>
                	<center>
                		<div style="width:900px;">
	                        <p style="text-align:left;"><a href="/add.html" >添加留言</a></p>
	                        <table class="table table-bordered">
	                                <tr>
	                                        <th>ID</th>
	                                        <th>用户名</th>
	                                        <th>留言信息</th>
	                                        <th>时间</th>
	                                        <th>操作</th>
	                                </tr>
	                                {dta}
	                        </table>
                        </div>
                    </center>
                 </body>
         </html>
        '''.format(dta=trs)
print(html)




