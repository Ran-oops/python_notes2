import scrapy

# 继承这个类
class BaiduSpider(scrapy.Spider):
    name = 'baidu' # 爬虫名称
    start_urls = ['http://www.baidu.com'] # 爬虫起始url地址

    # 处理响应结果
    def parse(self, response):
        with open('baidu.html' ,'w', encoding='utf-8') as f:
            f.write(response.body.decode('utf-8'))