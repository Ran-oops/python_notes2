from urllib import request

#定义url
base_url='http://www.xicidaili.com'

#构造请求对象（携带更多信息）
#构造请求头

headers={
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
}
req=request.Request(url=base_url,headers=headers)

#发起请求
response=request.urlopen(req)

#读取响应内容
html=response.read().decode(encoding='utf-8')

with open('xici.html','w',encoding='utf-8') as f:
    f.write(html)