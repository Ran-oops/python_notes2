# Scrapy settings for example project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/topics/settings.html
#
SPIDER_MODULES = ['example.spiders']
NEWSPIDER_MODULE = 'example.spiders'

USER_AGENT = 'scrapy-redis (+https://github.com/rolando/scrapy-redis)'
# 配置scrapy-redis 去重类
DUPEFILTER_CLASS = "scrapy_redis.dupefilter.RFPDupeFilter"

# 配置scrapy-redis 调度器
SCHEDULER = "scrapy_redis.scheduler.Scheduler"

# 调度器是否能中止
SCHEDULER_PERSIST = True

# 请求队列模式，有如下三种，选一种就可以了
# 按照优先级调度请求  request  priority属性（默认0）  q = (0,0,0,1,1,3)
SCHEDULER_QUEUE_CLASS = "scrapy_redis.queue.SpiderPriorityQueue"
# 按照FIFO 队列 调度请求
#SCHEDULER_QUEUE_CLASS = "scrapy_redis.queue.SpiderQueue"
# 按照LIFO 队列 调度请求
#SCHEDULER_QUEUE_CLASS = "scrapy_redis.queue.SpiderStack"

ITEM_PIPELINES = {
    'example.pipelines.ExamplePipeline': 300,
    'scrapy_redis.pipelines.RedisPipeline': 400, # 数据加入到redis里
}

# LOG_LEVEL = 'DEBUG'

# Introduce an artifical delay to make use of parallelism. to speed up the
# crawl.

#下载延迟
DOWNLOAD_DELAY = 1

# redis 连接信息
REDIS_HOST = '127.0.0.1'
REDIS_PORT = 6379