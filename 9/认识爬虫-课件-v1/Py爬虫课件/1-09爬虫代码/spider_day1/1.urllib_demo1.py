from urllib import request

# 定义目标url
base_url = 'http://www.baidu.com'

# 发起一个 GET 类型请求
# 返回一个类文件对象
response = request.urlopen(url=base_url)

# 读取响应内容
html = response.read().decode('utf-8')  #读取btyes类型，转成str类型

# 对内容文件保存
with open('baidu.html','w' ,encoding='utf-8') as f:
    f.write(html)