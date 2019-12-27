from bs4 import BeautifulSoup
import requests

response = requests.get('http://www.itxdl.cn/activity/jiuyejianbao/')
response.encoding = 'gbk'
html = response.text
html = BeautifulSoup(html,'lxml')

# 获取所有学生li
stu_list = html.select('div[class*="mingxing_1600"] > li')
# print(stu_list)
for stu in stu_list:
    info = stu.select('span')
    if len(info) == 7:
        # print(type(info[0].text),info[0].text)
        date_time = info[0].text.strip()
        name = info[1].text.strip()
        college = info[2].text.strip()
        degree = info[3].text.strip()
        company = info[4].text.strip()
        salary = info[5].text.strip()
        location = info[6].text.strip()
        print(date_time,name,college,degree,company,salary,location)
