from selenium import webdriver
import time
from lxml import etree
from queue import Queue
import threading
from urllib import request

#下载任务
task_q=Queue()


chrome=webdriver.Chrome(executable_path=r'D:\安装包\chromedriver\chromedriver.exe')
#鬼吹灯url
# base_url="http://www.ting56.com/video/8045-0-0.html"
# base_url="http://www.ting56.com/mp3/195.html"
base_url="http://www.ting56.com/"

def getpage():
    for i in range(0,2):
        full_url=base_url+'video/8480-0-'+str(i)+'.html'
        chrome.get(full_url)
        time.sleep(2)
        html = chrome.page_source

        html=etree.HTML(html)
        audio_url=html.xpath('//audio/@src')[0]
        print(audio_url)

        #下载地址加入队列
        task_q.put(audio_url)

if __name__=='__main__':
    getpage()
    #创建多线程进行下载



