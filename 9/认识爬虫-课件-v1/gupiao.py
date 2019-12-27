from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import time
from lxml import etree
'''
from urllib import request
base_url='https://xueqiu.com/stock/cata/stocklist.json?page=2&size=30&order=desc&orderby=percent&type=30&isdelay=1&_=1536584216992'
headers={
    "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    # "Accept-Encoding":"gzip, deflate, br",
    "Accept-Language":"zh-CN,zh;q=0.9",
    "Cache-Control":"max-age=0",
    "Connection":"keep-alive",
    "Cookie":"aliyungf_tc=AQAAAOXqGUVeGg0AedfmdMvWqy/qbp1t; s=er12zfbnwa; Hm_lvt_1db88642e346389874251b5a1eded6e3=1536582084; __utma=1.192981073.1536582096.1536582096.1536582096.1; __utmc=1; __utmz=1.1536582096.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmt=1; device_id=9a91ca870974ed007a5d2f5f9c7b2606; xq_a_token=f4cf4ff695debcc090a65185a6e2f5e845cc2612; xqat=f4cf4ff695debcc090a65185a6e2f5e845cc2612; xq_r_token=3e70bc581508546754e4bfa1fdba88babbcbad51; xq_token_expire=Fri%20Oct%2005%202018%2020%3A22%3A10%20GMT%2B0800%20(CST); xq_is_login=1; u=5853364360; bid=d09fa4a1201c432ba4ec8b803390662d_jlw9bw3y; __utmb=1.4.9.1536582145005; Hm_lpvt_1db88642e346389874251b5a1eded6e3=1536582240",
    "Host":"xueqiu.com",
    "Referer":"https://xueqiu.com/hq",
    "Upgrade-Insecure-Requests":"1",
    "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36",
}
req=request.Request(url=base_url,headers=headers)
response=request.urlopen(req)
html=response.read().decode('utf-8')
print(html)

'''
from selenium import webdriver
import time
# 初始化浏览器
# browser = webdriver.PhantomJS(executable_path=r'C:\MyProgram\phantomjs-2.1.1-windows\bin\phantomjs.exe')
browser = webdriver.PhantomJS(executable_path=r'D:\安装包\fantomjs\phantomjs-2.1.1-windows\bin\phantomjs.exe')

# 设置user-agent
dcap = dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"] = (
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"
)

browser = webdriver.PhantomJS(desired_capabilities=dcap)
browser.get('https://xueqiu.com/stock/cata/stocklist.json?page=2&size=30&order=desc&orderby=percent&type=30&isdelay=1&_=1536584216992')
time.sleep(0.5)

# # 找到输入框，发送按键
# browser.find_element_by_id('kw').send_keys('芳华')
#
# # 找到输入框点击
# browser.find_element_by_id('su').click()
# time.sleep(0.5)

# 获取浏览器截图,一定是png
browser.save_screenshot('stock.png')

# 获取当前页面代码
print(browser.page_source)

# 退出浏览器print()
browser.quit()
