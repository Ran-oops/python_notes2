from selenium import webdriver
import time
#初始化浏览器
browser=webdriver.PhantomJS(executable_path=r'D:\安装包\fantomjs\phantomjs-2.1.1-windows\bin\phantomjs.exe')

browser.get('http://www.baidu.com')
time.sleep(0.5)

#找到输入框，发送按键
browser.find_element_by_id('kw').send_keys('芳华')

#找到输入框点击
browser.find_element_by_id('su').click()
time.sleep(0.5)
#获取浏览器截图，一定是png
browser.save_screenshot('baidu.png')

#获取当前页面代码
print(browser.page_source)

#退出浏览器
browser.quit()