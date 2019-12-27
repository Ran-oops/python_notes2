from urllib import request,parse
import re

base_url='https://tieba.baidu.com/p/5814192949'
response=request.urlopen(base_url)
html=response.read().decode('utf-8')
pic_pattern=re.compile(r'<img class="BDE_Image" src="(.*?)"')
res=pic_pattern.findall(html)
#print(res)

headers={
    'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
}
for src in res:
    req=request.Request(src,headers=headers)
    response=request.urlopen(req)
    fname=src.split('/')[-1]
    print('downloading...%s' % src)
    img=response.read()
    with open('./images/' + fname,'wb') as f:
        f.write(img)
