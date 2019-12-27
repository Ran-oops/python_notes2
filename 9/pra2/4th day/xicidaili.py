from urllib import request
import re
import json
import time
import random

base_url='http://www.xicidaili.com/nn/'
headers={
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
}

def filterspeed(content):
    speed_p=re.compile(r'title="(.*?)"')
    res=speed_p.search(content)
    if res is not None:
        second=res.group(1).replace('秒','')
        # print(second,type(second))
        if float(second)<1:
            return True,second

        else:
            return False,''


def getpage(f):
    req=request.Request(base_url,headers=headers)
    response=request.urlopen(req)
    html=response.read().decode('utf-8')
    #获取table
    table_p=re.compile('<table id="ip_list">.*?</table>',re.S)
    table=table_p.search(html)
    if table is not None:
        #print(table.group())
        t_content=table.group()
        tr_p=re.compile(r'<tr.*?>(.*?)</tr>',re.S)
        tr_list=tr_p.findall(t_content)[1:]#过滤th表头

        #循环所有的tr,找到所有的td
        for tr_content in tr_list:
            #print(tr)
            td_p=re.compile(r'<td.*?>(.*?)</td>',re.S)
            td_list=td_p.findall(tr_content)
            #print(td_list)
            host=td_list[1]
            port=td_list[2]
            http_type=td_list[5]
            res=filterspeed(td_list[6])
            print(res)
            if not res[0]:   #过滤连接速度小于1秒的
                continue
            else:  #速度小于1秒
                speed=res[1]

            #过滤存活天数
            alive=td_list[8]
            if '天' in alive:
                alive=alive.replace('天','')
                alive=int(alive)
                if alive < 5:
                    continue
            else:
                continue

            #json存储
            proxy={
                'host':host,
                'port':port,
                'speed':speed,
                'alive':alive
            }
            f.write(json.dumps(proxy)+'\n')
if __name__=='__main__':
    f=open('proxy','w',encoding='utf-8')
    getpage(f)
    f.close()



