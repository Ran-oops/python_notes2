from selenium import webdriver
import time
from lxml import etree

chrome=webdriver.Chrome(executable_path=r'D:\安装包\chromedriver\chromedriver.exe')

def getpage():
    chrome.get('https://www.douyu.com/directory/all')
    time.sleep(3)
    html = chrome.page_source
    parsepage(html)

    while 'shark-pager-disable-next' not in html:
        chrome.find_element_by_class_name('shark-pager-next').click()
        time.sleep(0.5)
        html=chrome.page_source
        parsepage(html)


def parsepage(html):
    html=etree.HTML(html)
    room_li = html.xpath('//ul[@id="live-new-show-content-box"]/li | //ul[@id="live-list-contentbox"]/li')
    for room in room_li:
        room_name = room.xpath('.//h3/text()')[0].strip()
        room_type = room.xpath('.//span[@class="tag ellipsis"]/text()')[0].strip()
        nick = room.xpath('.//span[@class="dy-name ellipsis fl"]/text()')[0].strip()
        number = room.xpath('.//span[@class="dy-num fr"]/text()')
        number = number[0].strip() if number else 0
        if number != 0 and '万' in number:
            number = number.strip('万')
            number = float(number) * 10000

        print(room_name, room_type, nick, number)


if __name__ == '__main__':
    getpage()
