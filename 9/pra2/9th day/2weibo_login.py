from selenium import webdriver
import time
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

# 设置user-agent
dcap = dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"] = (
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:25.0) Gecko/20100101 Firefox/25.0 "
)

browser=webdriver.PhantomJS(executable_path=r'D:\安装包\fantomjs\phantomjs-2.1.1-windows\bin\phantomjs.exe',desired_capabilities=dcap)

browser=webdriver.PhantomJS(desired_capabilities=dcap)
browser.get('https://weibo.com/')

time.sleep(2)
browser.save_screenshot('weibo.png')

#找到输入框，发送按键
browser.find_element_by_id('loginname').send_keys('18600672750')
browser.find_element_by_class_name('W_input ').send_keys('1234qwer')
