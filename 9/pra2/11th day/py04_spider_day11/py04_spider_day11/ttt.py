import requests
from selenium import webdriver
import time

browser=webdriver.PhantomJS(executable_path=r"D:\安装包\fantomjs\phantomjs-2.1.1-windows\bin\phantomjs.exe")
base_url='https://detail.tmall.com/item.htm?id=550663506722&ali_refid=a3_430585_1006:1110786376:N:%E5%90%89%E4%BB%96:7aeadaeeeb52bd65bd4ead1ccfdab1e8&ali_trackid=1_7aeadaeeeb52bd65bd4ead1ccfdab1e8&spm=a230r.1.14.1'
# response=requests.get(base_url)
browser.get(base_url)  #没有response，它的response直接体现在browser对象中了，browser对象中就可以直接获取响应内容和截图了
time.sleep(1)
browser.save_screenshot('taobao.png')
print(browser.page_source)
browser.quit()
