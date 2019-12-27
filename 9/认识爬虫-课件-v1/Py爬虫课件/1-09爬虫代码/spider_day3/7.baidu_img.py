from urllib import request,parse
import re


base_url = 'https://tieba.baidu.com/p/5455799495'

response = request.urlopen(base_url)
html = response.read().decode('utf-8')

pic_pattern = re.compile(r'<img class="BDE_Image" src="(.*?)"')

res = pic_pattern.findall(html)

# 下载函数  类似 linux wget命令
# for src in res:
#     # 获取图片名称
#     fname = src.split('/')[-1]
#     print('downloading...%s' % src)
#     request.urlretrieve(src,'./images/' + fname)

headers = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
}

# 二进制文件存储图片
for src in res:
    req = request.Request(src,headers=headers)
    response = request.urlopen(req)
    fname = src.split('/')[-1]
    print('downloading...%s' % src)
    with open('./images/' + fname, 'wb') as f:
        f.write(response.read())


