from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule


class DmozSpider(CrawlSpider):
    """Follow categories and extract links."""
    name = 'hao123'
    allowed_domains = ['hao123.com']
    start_urls = ['http://www.hao123.com/']

    rules = [
        Rule(LinkExtractor(), callback='parse_directory', follow=False),
    ]
        #LinkExtractor()指的是获取所有链接。follow=False指的是只获取首页
    def parse_directory(self, response):
        yield {
            'title' : response.css('title::text').extract()[0]
        }
