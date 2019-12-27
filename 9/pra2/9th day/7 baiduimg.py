from selenium import webdriver
import time
from lxml import etree
from urllib import request
import uuid

chrome=webdriver.Chrome(executable_path=r'D:\安装包\chromedriver\chromedriver.exe')
chrome.get('http://image.baidu.com/search/index?tn=baiduimage&word=%E5%B0%8F%E7%BE%8E')
time.sleep(3)

def getpage():
    html=chrome.page_source
    parsepage(html) #首次解析图片

    #向下滚动
    while True:
        chrome.execute_script('scrollTo(0,document.body.scrollHeight)')
        time.sleep(2)
        html=chrome.page_source
        parsepage(html)

def parsepage(html):
    html=etree.HTML(html)
    img_url=html.xpath('//div[@class="imgpage"][last()]//ul//li/@data-objurl')
    #print(img_url)
    for url in img_url:
        fname=str(uuid.uuid4())
        print('downloading... %s' % url)
        try:
            request.urlretrieve(url,'./baiduimg/'+fname+'.jpg')
        except Exception as e:
            print('遇到广告')

        if __name__=='__main__':
            getpage()