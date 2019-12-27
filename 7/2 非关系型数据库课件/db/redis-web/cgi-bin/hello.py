#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  


# python 链接redis
r = redis.Redis(host='127.0.0.1', port=6379,decode_responses=True)



res = r.lrem('uids','6')
print(res)