import requests
from lxml import etree
from urllib import request
import json
# 获取分页

def getPage():
    base_url = 'https://www.qiushibaike.com/8hr/page/%d/'
    max = 3

    duanzi_list = []

    for i in range(1,max):
        fullurl = base_url % i
        response = requests.get(fullurl)
        html = response.text
        html = etree.HTML(html) # 格式化html

        # 获取所有段子div
        duanzi_div = html.xpath('//div[@id="content-left"]/div')

        for duanzi in duanzi_div:
            nick = duanzi.xpath('.//h2/text()')[0].strip('\n')
            age = duanzi.xpath('.//div[@class="articleGender womenIcon"]/text() | .//div[@class="articleGender manIcon"]/text()')
            age = age[0] if age else 0

            gender = duanzi.xpath('.//div[@class="author clearfix"]/div/@class')
            gender = gender[0] if gender else '中'
            if 'man' in gender:
                gender = '男'
            elif 'women' in gender:
                gender = '女'
            # 获取内容的span
            if duanzi.xpath('.//span[@class="contentForAll"]'): # 有详情页
                detail_url = duanzi.xpath('.//a[@class="contentHerf"]/@href')[0]
                detail_url = request.urljoin(response.url,detail_url)
                response = requests.get(detail_url)
                con_html = response.text
                con_html = etree.HTML(con_html)
                con_div = con_html.xpath('//div[@class="content"]')[0]
                content = con_div.xpath('string(.)').strip()

            else: # 直接获取全部段子内容
                span = duanzi.xpath('.//div[@class="content"]/span')[0]
                content = span.xpath('string(.)').strip()

            laugh = duanzi.xpath('.//span[@class="stats-vote"]/i/text()')[0]
            comment = duanzi.xpath('.//span[@class="stats-comments"]//i/text()')[0]

            # 段子图片
            duanzi_pic = duanzi.xpath('.//img[@class="illustration"]/@src')
            if duanzi_pic:
                pic_url = duanzi_pic[0]
                pic_url = request.urljoin(response.url,pic_url)

                # 下载段子图片
                fname = pic_url.split('/')[-1]
                request.urlretrieve(pic_url,'./duanzi/' + fname)
            else:
                fname = ''
            #print(content)

            item = {
                'nick' : nick,
                'age' : age,
                'gender' : gender,
                'content' : content,
                'laugh' : laugh,
                'comment' : comment,
                'pic' : fname
            }
            duanzi_list.append(item)
            # if i != max:
            #     f.write(json.dumps(item,ensure_ascii=False) + ',' + '\n')
            # else:
            #     f.write(json.dumps(item, ensure_ascii=False))

    f.write(json.dumps(duanzi_list,ensure_ascii=False,indent=4))

if __name__ == '__main__':
    f = open('duanzi.json','w',encoding='utf-8')
    getPage()
    f.close()