from bs4 import BeautifulSoup
import requests

base_url='http://www.itxdl.cn/activity/jiuyejianbao/'
response=requests.get(base_url)
response.encoding='gbk'
html=response.text
#print(html)

html=BeautifulSoup(html,'lxml')
students_list=html.select('div[class="w715 gaoxin_60 php_kecheng_neirong php_gaoxinjiuye mingxing_1600"] li')
#print(students_list)
for stu in students_list:
    info=stu.select('span')
    if len(info) == 7:
        date_time = info[0].text.strip()
        name = info[1].text.strip()
        college = info[2].text.strip()
        degree = info[3].text.strip()
        company = info[4].text.strip()
        salary = info[5].text.strip()
        location = info[6].text.strip()
        print(date_time, name, college, degree, company, salary, location)

