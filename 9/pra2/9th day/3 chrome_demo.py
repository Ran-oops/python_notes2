from selenium import webdriver
import time
chrome=webdriver.Chrome(executable_path=r'D:\安装包\chromedriver\chromedriver.exe')
chrome.get('http://www.weibo.com')
time.sleep(6)

chrome.find_element_by_id('loginname').send_keys('18600672750')
chrome.find_element_by_css_selector('input [type="password"]').send_keys('1234qwer')
chrome.find_element_by_css_selector('div[class="info_list login_btn"] a').click()