from bs4 import BeautifulSoup
import re

html = """
<html><head><title><p>The Dormouse's <br> story</p></title></head>
<body>
<p class="title" name="dromouse" id="p1"><b class="title">The Dormouse's story</b></p>
<p class="story1">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister1" id="link1"><!-- Elsie --></a>,
<a href="http://example.com/lacie" class="sister2" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister3" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>
<p class="story">...</p>
"""
# 格式化的html
html = BeautifulSoup(html,'lxml')
# print(html.prettify())

# print(html.title) # 返回一个bs4对象，一个标签

# print(html.title.name)
# print(html.title.string) # 返回bs4对象
# print(html.title.text) # 返回字符串

# print(html.p.text) # 返回第一个标签

# print(html.p.attrs) # 获取一个标签所有属性

# print(html.p['name']) # 获取单个属性

tags = html.body.contents #返回所有子节点  类型列表

tags = html.body.children # 返回所有子节点  类型 迭代器

# for tag in tags:
#     print(tag)

# 获取所有子孙节点
# for tag in html.body.descendants:
#     print(tag)

# res = html.find_all('p')  # 获取所有p标签

# res = html.find_all(re.compile(r'^b')) # 支持正则匹配标签

# 按照属性过滤标签
# res = html.find_all('p',attrs={'name' : 'dromouse' ,'id' : 'p1'})

# res = html.find_all(['p','b'],attrs={'class': 'story'}) # 所有p 标签和b标签
# for a in res[0].find_all('a'):
#     print(a.text)

# 选出所有class=title的p标签
# res = html.select('p.title')
# res = html.select('p .title') # p标签下的class=title的标签
# res = html.select('#p1')
# res = html.select('head > p') # 寻找head 下的 子节点
# res = html.select('head p') # 寻找head下的 所有子孙节点
# res = html.select('p#p1 , p.story')  # 或者的关系
# res = html.select('p#p1 , p.story')  # 或者的关系
# res = html.select('a[class="sister"]')
# res = html.select('a[class]') # 筛选所有包含class的a标签
# res = html.select('a[class*="sister"]') # 模糊查询
# res = html.select('a[class^="sister"]') # sister开头的
# res = html.select('a[class$="sister"]') # sister结尾的

#print()