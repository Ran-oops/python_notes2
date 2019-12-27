import requests
from selenium import webdriver
import time
browser = webdriver.PhantomJS()

base_url = 'https://detail.tmall.com/item.htm?id=532871765977&ali_refid=a3_430583_1006:1123014618:N:%E7%94%B5%E5%AD%90%E7%90%B4:5d8abb6388c1370ef9a9f3a11b4099a7&ali_trackid=1_5d8abb6388c1370ef9a9f3a11b4099a7&spm=a230r.1.14.1'
browser.get(base_url)
time.sleep(1)
browser.save_screenshot('tabao.png')
print(browser.page_source)
browser.quit()