# -*- coding: utf-8 -*-
import scrapy
from scrapy_test.items import Proxy66Item

class Spider66Spider(scrapy.Spider):
    name = 'spider66'
    allowed_domains = ['66ip.cn']
    start_urls = ['http://www.66ip.cn/']
    base_url = 'http://www.66ip.cn/%d.html'
    i = 1

    # 解析首页请求
    def parse(self, response):
        # 提取 代理信息 并交给管道文件
        proxy_list = response.xpath('//div[@align="center"]/table//tr')[1:]

        for proxy in proxy_list:
            item = Proxy66Item()

            info = proxy.xpath('./td/text()').extract()
            host = info[0]
            port = info[1]

            item['host'] = host
            item['port'] = port

            yield item

        # 生成下一页请求
        if self.i < 2:
            self.i += 1
            fullurl = self.base_url % self.i # 生成url请求地址
            # callback 回掉函数,处理响应结果
            yield scrapy.Request(fullurl,callback=self.parse) # 把请求加入队列


