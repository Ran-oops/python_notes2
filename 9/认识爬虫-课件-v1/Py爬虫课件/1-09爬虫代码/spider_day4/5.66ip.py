import downloader
from urllib import request

base_url = 'http://www.66ip.cn/'
proxies = downloader.getProxy('authproxy')
html = downloader.downloader(downloader.getOpener(proxies),base_url)
print(html.decode('gbk'))