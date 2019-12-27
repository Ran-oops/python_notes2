import requests
from lxml import etree
from urllib import request
import json
#获取分页

def getpage():
    base_url='https://www.qiushibaike.com/8hr/page/%d/'
    max=3

    duanzi_list=[]
    for i in range(1,max):
        fullurl=base_url % i
        response=requests.get(fullurl)
        html=response.text
        html=etree.HTML(html)   #格式化html

        #获取所有段子div
        duanzi_div=html.xpath('//div[@id="content-left"]/div')

        for duanzi in duanzi_div:
            nick=duanzi.xpath('./div//h2/text()')[0].strip('\n')
            age=duanzi.xpath('./div/div[@class="articleGender manIcon"]/text() |  ./div/div[@class="articleGender womenIcon"]/text()')
            age=age[0] if age else 0

            gender=duanzi.xpath('./div/div/@class')
            gender=gender[0] if gender else '中'
            if 'man' in gender:
                gender='男'
            elif 'women' in gender:
                gender='女'

            #获取内容的span
            if duanzi.xpath('.//span[@class=""]'):  #有详情页
                detail_url=duanzi.xpath('.//a[@class="contentHerf"]/@href')[0]
                detail_url=request.urljoin(response.url,detail_url)
                response=requests.get(detail_url)
                con_html=response.text
                con_html=etree.HTML(con_html)
                con_div=con_html.xpath('//div[@class="Content"]')[0]
                content=con_div.xpath('string(.)').strip()

            else:  #直接获取全部段子内容
                span=duanzi.xpath('.//div[@class="content"]/span/text()')[0]
                content=span.xpath('string(.)').strip()

            laugh=duanzi.xpath('.//span[@class="stats-vote"]/i/text()')[0]
            comment=duanzi.xpath('.//[@class="stats-comments"]//i/text()')[0]

            #段子图片
            duanzi_pic=duanzi.xpath('.//div[@class="thumb"]/a/img/@src')
            if duanzi_pic:
                pic_url=duanzi_pic[0]
                pic_url=request.urljoin(response.url,pic_url)

                #下载段子图片
                fname=pic_url.split('/')[-1]
                request.urlretrieve(pic_url,'./duanzi/'+fname)
            else:
                fname=''

            item={
                'nick':nick,
                'age':age,
                'gender':gender,
                'laugh':laugh,
                'comment':comment,
                'pic':fname
            }
            duanzi_list.append(item)
    f.write(json.dumps(duanzi_list,ensure_ascii=False,indent=4))



if __name__=='__main__':
    f=open('duanzi.json','w',encoding='utf-8')
    getpage()
    f.close()
