# -*- coding: utf-8 -*-
import cgi,cgitb,time
cgitb.enable()

print("Content-Type: text/html")    # HTML is following
print()                             # blank line, end of headers  






fs=cgi.FieldStorage()
inputs={}
for key in fs.keys():
	inputs[key]=fs[key].value


print(inputs)



#time.sleep(3)
print('hello, sunshine!')