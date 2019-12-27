from urllib import request

# 定义目标url
base_url = 'http://www.xicidaili.com'

# 构造请求对象（携带更多信息的请求），然后再发起请求
#构造请求头
headers = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
}

req = request.Request(base_url,headers=headers)

#发起请求
response = request.urlopen(req)

# 读取响应内容
html = response.read().decode('utf-8')  #读取btyes类型，转成str类型

# 对内容文件保存
with open('xici.html','w' ,encoding='utf-8') as f:
    f.write(html)