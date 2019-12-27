from urllib import request
import re
import json
import time
import random

base_url = 'http://www.xicidaili.com/nn/%d'

headers = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
}

def filterspeed(content):
    speed_p = re.compile(r'title="(.*?)"')
    res = speed_p.search(content)
    if res is not None:
        second = res.group(1).replace('秒','')
        if float(second) < 1:
            return True,second
        else:
            return False,''

def getPage(f):
    for i in range(1,6):
        fullurl = base_url % i
        print('downloading...%s' % fullurl)
        req = request.Request(fullurl,headers=headers)
        time.sleep(random.randint(1,3))

        response = request.urlopen(req)


        html = response.read().decode()

        # 获取table
        table_p = re.compile('<table id="ip_list">.*?</table>',re.S)
        table = table_p.search(html)
        if table is not None:
            t_content = table.group()

            tr_p = re.compile(r'<tr.*?>(.*?)</tr>',re.S)

            tr_list = tr_p.findall(t_content)[1:]  # 过滤th表头

            # 循环所有tr，找到所有td
            for tr_content in tr_list:
                td_p = re.compile('<td.*?>(.*?)</td>',re.S)
                td_list = td_p.findall(tr_content)
                host = td_list[1]
                port = td_list[2]
                http_type = td_list[5]
                res = filterspeed(td_list[6])

                # 过滤连接速度小于1秒的
                if not res[0]:
                    continue
                else: # 速度小于1秒
                    speed = res[1]

                # 过滤存活天数
                alive = td_list[8]
                if '天' in alive:
                    alive = alive.replace('天','')
                    alive = int(alive)
                    if alive < 5:
                        continue
                else:
                    continue

                # json存储
                proxy = {
                    'http_type' : http_type,
                    'host' : host,
                    'port' : port,
                    'speed' : speed,
                    'alive' : alive,
                }

                f.write(json.dumps(proxy,ensure_ascii=False) + '\n')

if '__main__' == __name__:
    f = open('proxy2','w',encoding='utf-8')
    getPage(f)
    f.close()







