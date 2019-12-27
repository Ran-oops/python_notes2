from bs4 import BeautifulSoup
import requests

base_url = 'http://hr.tencent.com/position.php?start=%d'

headers = {
    'Accept': '*/*',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Connection': 'keep-alive',
    # 'Content-Length': '105',
    'Content-Type': 'application/json; charset=UTF-8',
    # 'Cookie': 'TYCID=bf41a6508bf111e8aee66753b422ed9a; undefined=bf41a6508bf111e8aee66753b422ed9a; ssuid=3779962336; aliyungf_tc=AQAAAJrS4ABtYAkAUhVFedbGijuIbyzQ; csrfToken=cBObpGtobpUia10YpNgF8lDZ; Hm_lvt_e92c8d65d92d534b0fc290df538b4758=1532073105,1532153952; _ga=GA1.2.582409617.1532153953; _gid=GA1.2.556883371.1532153953; bannerFlag=true; Hm_lpvt_e92c8d65d92d534b0fc290df538b4758=1532154966',
    # 'Host': 'www.tianyancha.com',
    # 'Origin': 'https://www.tianyancha.com


    # 'Referer': 'https://www.tianyancha.com/login


    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',
    'X-Requested-With': 'XMLHttpRequest'
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