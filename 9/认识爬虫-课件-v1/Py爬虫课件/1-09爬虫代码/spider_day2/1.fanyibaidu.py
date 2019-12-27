from urllib import request,parse
import json # 处理json的模块

base_url = 'http://fanyi.baidu.com/sug'

def fanyi(kw):
    # 构造请求对象
    data = {
        'kw' :'hello'
    }

    data = parse.urlencode(data) # 转成字符串
    length = len(data)
    # print(data,type(data))

    # 构造请求头
    headers = {
        'Content-Length' : length
    }
    # 构造请求对象
    req = request.Request(url=base_url,data=bytes(data,encoding='utf-8') ,headers=headers)

    response = request.urlopen(req)

    json_data = response.read().decode('utf-8')

    # 把json字符串转化成字典
    json_data = json.loads(json_data)

    # 格式化输出字典
    # 把字典转成字符串
    # json_data = json.dumps(json_data,ensure_ascii=False,indent=4)
    # print(json_data,type(json_data))
    res = ''
    for item in json_data['data']:
        res += item['v'] + '\n'

    print(res)



if __name__ == '__main__':
    while True:
        kw = input('请输入翻译的单词：')
        if kw == 'q':
            break
        fanyi(kw)
