from urllib import request
import json

base_url='https://movie.douban.com/j/chart/top_list?type=11&interval_id=100%3A90&action=&start=60&limit=20'
response=request.urlopen(base_url)
data=response.read().decode('utf-8')

data=json.loads(data)

#格式化存入到文件中，一行就是一条记录
with open('movie.json','w',encoding='utf-8') as f:
    for item in data:
        f.write(json.dumps(item,ensure_ascii=False)+'\n')