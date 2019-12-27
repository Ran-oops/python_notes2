# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor  # 提取网页超链接的类
from scrapy.spiders import CrawlSpider, Rule


class TencentCrawlSpider(CrawlSpider):
    name = 'tencent_crawl'
    allowed_domains = ['tencent.com']
    start_urls = ['http://hr.tencent.com/position.php']

    rules = (
        # 把提取的链接全部加入请求队列
        # follow 如果为True（默认是True） 则会在跟进链接中继续匹配符合正则规则的超链接
		#LinkExtractor是提取链接的，allow里面是正则表达式，里面是元组，是查询符合的。
		#详情页才会走callback
        Rule(LinkExtractor(allow=(r'hr.tencent.com/position.php')), follow=True),
        Rule(LinkExtractor(allow=(r'hr.tencent.com/social.php')), follow=True),
        Rule(LinkExtractor(allow=(r'position_detail.php\?id=\d+')), callback='parse_item', follow=False,process_links='process_links'),
    )

    def process_links(self,links):
        for link in links:
            if '&' in link.url:
                link.url = link.url.split('&')[0]
            print(link.url)
        return links

    # 详情页解析函数
    def parse_item(self, response):
        title = response.xpath('//title/text()').extract()[0]
        item = {
            'title' : title
        }
        yield item
