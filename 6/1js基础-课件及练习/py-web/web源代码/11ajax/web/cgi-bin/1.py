# -*- coding: utf-8 -*-
import cgi,cgitb,time
cgitb.enable()

print("Content-Type: text/html")    # HTML is following
print()                             # blank line, end of headers  



print('哈哈,呵呵,嘻嘻')


fs = cgi.FieldStorage()
inputs = {}  
for key in fs.keys():  
     inputs[key] = fs[key].value  


print(inputs)
time.sleep(3)

print('<span style="color:red">ok</span>')


# print(fs["username"].value)
# print(fs["id"].value)
