from bs4 import BeautifulSoup
import requests

base_url="http://www.itxdl.cn/activity/teacher/teacher_lieibiao/"
response=requests.get(base_url)
response.encoding='gbk'
html=response.text
#print(html)

#格式化
html=BeautifulSoup(html,'lxml')

#所有老师的div
teacher_list=html.select('.php_jiangshi_liebiao')
#print(teacher_list)
for teacher in teacher_list:
    teacher_name=teacher.select('h1')[0].text
    teacher_desc=teacher.select('p')[0].text
    print(teacher_name)
    print(teacher_desc)