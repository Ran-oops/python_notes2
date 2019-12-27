from bs4 import BeautifulSoup
import requests

base_url="http://hr.tencent.com/position.php?start=%d"

for i in range(0,20+1,10):
    fullurl=base_url % i

headers={
    "Host":"hr.tencent.com",
    "Connection":"keep-alive",
    "Upgrade-Insecure-Requests":"1",
    "User-Agent":"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36",
    "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    # "Accept-Encoding":" gzip, deflate",
    "Accept-Language":"zh-CN,zh;q=0.9",
}
response=requests.get(fullurl,headers=headers)
response.encoding='utf-8'
html=response.text
# print(html)

html=BeautifulSoup(html,'lxml')
job_list=html.select('table.tablelist tr')[1:-1]
for job in job_list:
    info=job.select('td')
    #print(info)
    job_name=info[0].text
    job_type=info[1].text
    job_number=info[2].text
    job_location=info[3].text
    date_time = info[4].text

    print(job_name,job_type,job_number,job_location,date_time)
