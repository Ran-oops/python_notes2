# -*- coding: utf-8 -*-
import cgi,cgitb,json
cgitb.enable()

print("Content-Type: text/html")    # HTML is following
print()                             # blank line, end of headers  


# 返回数据类型 

# print(0);
# print('ok');

# arr = [1,2,3,4]

# arr = {'a':'abc','b':'bbc','c':'ccc'}

arr = [
	{'a':'abc','b':'bbc','c':'ccc'},
	{'a':'abc','b':'bbc','c':'ccc'},
	{'a':'abc','b':'bbc','c':'ccc'},
	{'a':'abc','b':'bbc','c':'ccc'},
]

print(arr)
# print('aabbcc')
# print(type(arr))

# print(json.dumps(arr))