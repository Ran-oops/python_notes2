from urllib import request,parse
import os

base_url = 'https://tieba.baidu.com/f?'

kw = input('贴吧名称：')
start = input('起始：')
end = input('结束：')

def tieba(kw,start,end):
    # 根据输入建立相应文件夹
    dir_name = './tieba/' + kw + '/'
    if not os.path.exists(dir_name): # 不存在就建立
        os.makedirs(dir_name)


    qs = {
        'kw' : kw,
    }

    # 构造pn查询参数
    for i in range(int(start),int(end) + 1):
        # 算出pn值
        # 关系
        # 1 0
        # 2 50
        # 3 100
        pn = (i - 1) * 50
        qs['pn'] = str(pn)

        qs_data = parse.urlencode(qs)

        # 构建一个完整的url地址
        fullurl = base_url + qs_data
        print('downlong page %s ' % fullurl)
        response = request.urlopen(fullurl)

        # 存入相应文件
        with open(dir_name + str(i) + '.html' ,'w',encoding='utf-8') as f:
            html = response.read().decode('utf-8')
            f.write(html)

if __name__ == '__main__':
    tieba(kw,start,end)