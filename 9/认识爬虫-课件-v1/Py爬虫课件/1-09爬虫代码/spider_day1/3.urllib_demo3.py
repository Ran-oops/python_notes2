from urllib import request,parse

# 定义目标url
base_url = 'http://www.baidu.com/s?'

wd = input('输入搜索关键词：')
qs = {
    'wd' : wd
}
qs = parse.urlencode(qs)  # 转换成url编码

fullurl = base_url + qs # 拼接完整的url

# 发起请求
response = request.urlopen(fullurl)
html = response.read().decode('utf-8')

print(html)