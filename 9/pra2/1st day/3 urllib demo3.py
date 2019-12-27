from urllib import request,parse

base_url='http://www.baidu.com/s?'
wd=input('请输入搜索关键字： ')
qs={
    'wd':wd
}
qs=parse.urlencode(qs)  #转换成url编码
fullurl=base_url+qs
response=request.urlopen(fullurl)
html=response.read().decode(encoding='utf-8')
print(html)