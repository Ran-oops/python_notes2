from urllib import request
import ssl
ssl._create_default_https_context = ssl._create_unverified_context # 默认不许要校验网站证书

response = request.urlopen('https://www.12306.cn/mormhweb/')
print(response.read().decode('utf-8'))