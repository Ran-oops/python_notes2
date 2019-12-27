# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
import re
import datetime
from datetime import timedelta
from py03_spider_day14.items import LagouItem

class LagouSpider(CrawlSpider):
    name = 'lagou'
    allowed_domains = ['lagou.com']
    start_urls = ['https://www.lagou.com']

    rules = (
        Rule(LinkExtractor(allow=r'zhaopin/.*'), follow=True),
        # Rule(LinkExtractor(allow=r'gongsi/j\d+.html'),follow=True),
        # Rule(LinkExtractor(allow=r'jobs/list_.*'), follow=True),
        Rule(LinkExtractor(allow=r'jobs/\d+.html'), callback='parse_item', follow=False),
    )

    custom_settings = {
        'DEFAULT_REQUEST_HEADERS' : {
            "Host": "www.lagou.com",
            "Connection": "keep-alive",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36",
            "Content-type": "application/json;charset=utf-8",
            "Accept": "*/*",
            "Referer": "https://www.lagou.com/jobs/3737258.html",
            "Accept-Encoding": "gzip, deflate, br",
            "Accept-Language": "zh-CN,zh;q=0.9",
            "Cookie": "user_trace_token=20171116192426-b45997e2-cac0-11e7-98fd-5254005c3644; LGUID=20171116192426-b4599a6d-cac0-11e7-98fd-5254005c3644; index_location_city=%E5%85%A8%E5%9B%BD; JSESSIONID=ABAAABAAAGFABEFC0E3267F681504E5726030548F107348; _gat=1; X_HTTP_TOKEN=d8b7e352a862bb108b4fd1b63f7d11a7; _gid=GA1.2.1718159851.1510831466; _ga=GA1.2.106845767.1510831466; Hm_lvt_4233e74dff0ae5bd0a3d81c6ccf756e6=1510836765,1510836769,1510837049,1510838482; Hm_lpvt_4233e74dff0ae5bd0a3d81c6ccf756e6=1510839167; LGSID=20171116204415-da8c7971-cacb-11e7-930c-525400f775ce; LGRID=20171116213247-a2658795-cad2-11e7-9360-525400f775ce",
        }
    }

    num_pattern = re.compile(r'\d+')

    # 解析职位详情
    def parse_item(self, response):
        item = LagouItem()

        url = response.url
        pname = response.css('.job-name::attr(title)').extract()[0] # 获取职位名称

        money = response.css('.job_request .salary::text').extract()[0] #
        smoney = money.lower().replace('k','').split('-')[0]
        emoney = money.lower().replace('k','').split('-')[1]

        location = response.xpath('//*[@class="job_request"]/p/span[2]/text()').extract()[0]
        location = self.remove_splash(location)

        year = response.xpath('//*[@class="job_request"]/p/span[3]/text()').extract()[0]
        syear ,eyear = self.process_year(year)

        degree = response.xpath('//*[@class="job_request"]/p/span[4]/text()').extract()[0]
        degree = self.remove_splash(degree)

        ptype = response.xpath('//*[@class="job_request"]/p/span[5]/text()').extract()[0]
        ptype = self.remove_splash(ptype)

        tags = response.css('.position-label li::text').extract()  # 获取职位所有标签
        tags = ','.join(tags) # 把所有标签连接成字符串

        date_pub = response.css('.publish_time::text').extract()[0]
        date_pub = self.process_date(date_pub)

        advantage = response.css('.job-advantage p::text').extract()[0]

        jobdesc = response.css('.job_bt div p::text').extract()
        jobdesc = ''.join(jobdesc)

        jobaddr1 = response.css('.work_addr a::text').extract()[:-1]
        jobaddr2 = response.css('.work_addr::text').extract()[-2].strip()
        jobaddr = ''.join(jobaddr1) + jobaddr2

        company = response.css('#job_company dt a img::attr(alt)').extract()[0]
        crawl_time = datetime.datetime.now().strftime('%Y-%m-%d')

        item['url'] = url
        item['pname'] = pname
        item['smoney'] = smoney
        item['emoney'] = emoney
        item['location'] = location
        item['syear'] = syear
        item['eyear'] = eyear
        item['degree'] = degree
        item['ptype'] = ptype
        item['tags'] = tags
        item['date_pub'] = date_pub
        item['advantage'] = advantage
        item['jobdesc'] = jobdesc
        item['jobaddr'] = jobaddr
        item['company'] = company
        item['crawl_time'] = crawl_time

        yield item

    def process_date(self,value):
        if '天前' in value:
            res = self.num_pattern.search(value).group()
            date_pub = (datetime.datetime.now() - timedelta(days=int(res))).strftime('%Y-%m-%d')
        else:
            date_pub = datetime.datetime.now().strftime('%Y-%m-%d')
        return date_pub

    def process_year(self,year):
        if '-' in year:
            res = self.num_pattern.findall(year)
            syear = res[0]
            eyear = res[1]
        elif '以上' in year:
            res = self.num_pattern.search(year)
            syear = res.group()
            eyear = res.group()
        else:
            syear = 0
            eyear = 0
        return syear,eyear

    def remove_splash(self,value):
        return value.replace('/','').strip()
