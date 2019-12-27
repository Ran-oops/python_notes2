from selenium import webdriver
import time
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

# 设置user-agent
dcap = dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"] = (
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:25.0) Gecko/20100101 Firefox/25.0 "
)

browser = webdriver.PhantomJS(desired_capabilities=dcap)
browser.get('https://www.weibo.com')

time.sleep(2)
browser.save_screenshot('weibo.png')

# # 输入账户名和密码
# browser.find_element_by_id('loginname').send_keys('18600672750')
# browser.find_element_by_class_name('W_input ').send_keys('1234qwer')
#
# # 点击登陆
# browser.find_element_by_class_name('W_btn_a btn_32px ').click()
# time.sleep(1)
# browser.save_screenshot('weibo.png')

browser.quit()