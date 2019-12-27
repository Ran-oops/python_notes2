# beautifulsoup4_test.py
from bs4 import BeautifulSoup
import re
html = """
<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title" name="dromouse"><b>The Dormouse's story</b></p>
<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1"><!-- Elsie --></a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>
<p class="story">...</p>
"""
#创建 Beautiful Soup 对象
soup = BeautifulSoup(html,'lxml')
#格式化输出 soup 对象的内容
#print(soup.prettify())
# print(soup.title)
# print(soup.head)
#print(soup.a)  #返回的是第一个a标签
#print(soup.p)
#print(type(soup.p))   #返回的结果<class 'bs4.element.Tag'>
# print(soup.name)   #返回结果 [document] #soup 对象本身比较特殊，它的 name 即为 [document]
# print(soup.head.name)
# print(soup.p.attrs)
# print(soup.p['class'])
# print(soup.p.get('class'))
# soup.p['class']='newclass'
# print(soup.p['class'])
# del soup.p['class']
# print(soup.p)
# print(soup.a.string)
#print(soup.p.string)
# print(soup.head)
# print(soup.head.contents)
# a=soup.head.contents[0]
# print(a)
# print(soup.head.children)
# for child in soup.body.children:
#     print(child)

# for child in soup.descendants:
#     print(child)
# print(soup.find_all('a'))

# for tag in soup.find_all(re.compile("^h")):
#     print(tag.name)

# a=soup.find_all(id="link2")
# print(a)

# a=soup.find_all(text="Lacie")
# print(a)

# print(soup.select('title'))
# print(soup.select('a'))
# print(soup.select('b'))

# print(soup.select('p #link1'))
# print(soup.select("head > title"))
# print(soup.select('a.sister'))

#print(soup.select('title'))
#a=soup.select('title')[0].get_text()
#print(a)
a=soup.select('title')
for i in a:
    print(i.get_text())