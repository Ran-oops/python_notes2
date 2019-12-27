'''
from scrapy import cmdline

cmdline.execute('scrapy crawl hao123'.split())


'''
from scrapy import cmdline
import os

os.chdir('example/spiders')
cmdline.execute('scrapy runspider mycrawler_redis.py'.split())
