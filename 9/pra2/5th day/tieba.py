import requests
from lxml import etree
import json
from urllib import request,parse

def getpage():
    base_url='http://tieba.baidu.com/f?ie=utf-8&kw=Python&pn=%d'
    for pn in range(0,1000+1,50):
        fullurl=base_url % pn
        response=requests.get(fullurl)

        url_prefix=response.url

        html=response.text
        parseList(html,url_prefix)

def parseList(html,url_prefix):
    html=etree.HTML(html)
    detail_url_list=html.xpath('//div[@class="threadlist_lz clearfix"]/div/a/@href')
    for url in detail_url_list:
        fullurl=parse.urljoin(url_prefix,url)
        html=requests.get(fullurl).text
        parseDetail(html)

def parseDetail(html):
    html=etree.HTML(html)
    img_url_list=html.xpath('//img[@class="BDE_Image"]/@src')
    for img_url in img_url_list:
        fname=img_url.split('/')[-1]
        request.urlretrieve(img_url,'./baidu/'+fname)

if __name__=='__main__':
    getpage()
