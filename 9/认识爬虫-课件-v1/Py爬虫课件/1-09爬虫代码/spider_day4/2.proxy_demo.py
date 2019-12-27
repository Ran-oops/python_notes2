from urllib import request

# 定义一个代理信息
# 免费代理
# proxy = {
#     'http' : 'http://120.9.79.227:9999',
#     'https' : 'http://120.9.79.227:9999',
# }

# 认证代理
proxy = {
    'http' : 'http://alice:123456@120.78.166.84:6666',
    'https' : 'http://alice:123456@120.78.166.84:6666'
}

# 代理管理器
proxy_handler = request.ProxyHandler(proxy)
opener = request.build_opener(proxy_handler)

response = opener.open('http://www.baidu.com/s?wd=ip')

print(response.read().decode('utf-8'))