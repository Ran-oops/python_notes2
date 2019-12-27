from scrapy_redis.spiders import RedisSpider

class MySpider(RedisSpider):
    """Spider that reads urls from redis queue (myspider:start_urls)."""
    name = 'myspider_redis' # 爬虫名称
    allowed_domains = ['hao123.com']
    redis_key = 'myspider:start_urls' # 在redis里启动爬虫的键

    def parse(self, response):
        return {
            'name': response.css('title::text').extract_first(),  #等于extract()[0]表示 拿取第一个
            'url': response.url,
        }
