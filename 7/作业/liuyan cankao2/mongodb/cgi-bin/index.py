#!/usr/bin/python3
import cgi,cgitb,pymongo
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    
print()                               


# python连接mongo，创建客户端,进入liuyan数据库
client=pymongo.MongoClient("192.168.0.105",27017)
db = client.liuyan
#查找所有数据
data = db.user.find()
print(data)

trs = ''
i=0
# 通过用户id找到所有的用户哈希，获取数据
for uinfo in data:
	
	
	i+=1
	uname = uinfo["username"]
	ucontent = uinfo['content']
	uaddtime = uinfo['addtime']
	urid =uinfo['_id']
	
	trs += '''
		<tr>
			<td>{rank}</td>
			<td>{name}</td>
			<td>{content}</td>
			<td>{addtime}</td>
			<td><a href="/cgi-bin/del.py?id={uid}">删除</a>|<a href="/cgi-bin/update.py?id={uid}">修改</a></td>
		</tr>
	'''.format(rank=i,name=uname,content=ucontent,addtime=uaddtime,uid=urid)


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




