from bs4 import BeautifulSoup
import requests

base_url = 'http://hr.tencent.com/position.php?start=%d'

headers = {
    "Host" : "hr.tencent.com",
    "Connection" : "keep-alive",
    "Pragma" : "no-cache",
    "Cache-Control" : "no-cache",
    "User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36",
    "Upgrade-Insecure-Requests" : "1",
    "Accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    "Referer" : "http://hr.tencent.com/position.php?start=10",
    # "Accept-Encoding" : "gzip, deflate",
    "Accept-Language" : "zh-CN,zh;q=0.9",
    "Cookie" : "pgv_pvi=746428416; _ga=GA1.2.1431388339.1511424985; ptui_loginuin=1752570559; ptcz=47c85ec23a597ce3c56b012680546dbaabcb9b7f3990d7bbce008f4e3b00a5a9; pt2gguin=o1752570559; PHPSESSID=fdna06uddud8jr00qaj3cbl3j3; pgv_info=ssid=s7311999400; ts_last=hr.tencent.com/position.php; pgv_pvid=848879536; ts_uid=3074260700",
}
def getPage():
    for i in range(0,20 + 1 ,10):
        fullurl = base_url % i
        response = requests.get(fullurl,headers=headers)
        html = response.text

        html = BeautifulSoup(html,'lxml')
        job_list = html.select('table.tablelist tr')[1:-1]
        # print(job_list)
        for job in job_list:
            info = job.select('td')
            job_name = info[0].a.text
            job_type = info[1].text
            job_number = info[2].text
            job_location = info[3].text
            date_time = info[4].text

            print(job_name,job_type,job_number,job_location,date_time)


if __name__ == '__main__':
    getPage()