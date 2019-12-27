# -*- coding: utf-8 -*-
import cgi,cgitb,time
cgitb.enable()

print("Content-Type: text/html")    # HTML is following
print() 





#需要引入json模块才可以让字典数据类型进行json格式输出
import json
#返回数据类型
#print(0)
#print('ok!')
#arr=[1,2,3,4]
arr={'a':'abc','b':'bbc','c':'ccc'}
#print(arr)
print(json.dumps(arr))