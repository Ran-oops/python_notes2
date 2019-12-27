from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import time
from lxml import etree

#设置user-agent
dcap=dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"]=(
"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:25.0"
)
browser = webdriver.PhantomJS(desired_capabilities=dcap)

def getindex():
    browser.get('https://www.lagou.com/jobs/list_python')
    time.sleep(3)
    html=browser.page_source
    #首次获取数据
    parsepage(html)

    #循环分页获取数据
    while True:
        browser.find_element_by_css_name('pager_next').click()
        time.sleep(0.5)
        html=browser.page_source
        parsepage(html)
        if 'pager_next_disabled' in html:
            break

def parsepage(html):
    html=etree.HTML(html)
    job_li=html.xpath('//ul[@class="item_con_list"]/li')
    for li in job_li:
        job_name=li.xpath('.//h3/text()')[0]
        salary=li.xpath('//span[@class="money"]/text()')
        address = li.xpath('.//span[@class="add"]/em/text()')[0]
        date_pub = li.xpath('.//span[@class="format-time"]/text()')[0]
        print(job_name, salary, address, date_pub)

#browser.save_screenshot('lagou.png')
if __name__=='__main__':
    getindex()
    browser.quit()


