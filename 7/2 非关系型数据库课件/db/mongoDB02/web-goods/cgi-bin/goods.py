#!/usr/bin/python3
import cgi,cgitb,json,pymongo
cgitb.enable()

print('Content-type:text/html;charset=utf-8')
print()                             # blank line, end of headers  


fs = cgi.FieldStorage()

p = fs["p"].value



# 链接mongo
client = pymongo.MongoClient('127.0.0.1',27017)

# 选择库
db = client.py5



p = int(p)
end = p*16
start = end-16;
# print(json.dumps(arr[start:end]));

res = db.goods.find({},{'_id':0}).skip(start).limit(16)

arr = []
for row in res:
	arr.append(row)



print(json.dumps(arr))
