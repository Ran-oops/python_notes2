from urllib import request
import ssl
ssl._create_default_https_context=ssl._create_unverified_context #默认不需要校验网站证书

response=request.urlopen('https://www.12306.cn/normhweb/')
print(response.read().decode('utf-8'))