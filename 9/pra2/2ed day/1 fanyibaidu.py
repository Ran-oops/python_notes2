from urllib import request,parse
import json   #处理json的模块

base_url='http://fanyi.baidu.com/sug'

def fanyi(kw):
    data={
        'kw':kw
    }
    data=parse.urlencode(data)   #转成字符串
    length=len(data)

    headers={
        'Content-length':length
    }
    req=request.Request(url=base_url,data=bytes(data,encoding='utf-8'),headers=headers)
    response=request.urlopen(req)
    json_data=response.read().decode('utf-8')
    json_data=json.loads(json_data)  #把json字符串转变成了字典类型
    #print(type(json_data))
    #print(json_data)
    #格式化输出字典
    #json_data=json.dumps(json_data,ensure_ascii=False,indent=4)  #dumps又把字典转化成字符串类型；
    #rint(json_data)
    for item in json_data['data']:
        print(item['v'])

if __name__=='__main__':
    while True:
        kw=input('请输入需要翻译的单词：')
        fanyi(kw)




