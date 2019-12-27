from datetime import datetime
from elasticsearch_dsl import DocType, Date, Nested, Boolean, \
    analyzer, InnerObjectWrapper, Completion, Keyword, Text,Integer

# es连接数据库
from elasticsearch_dsl.connections import connections
connections.create_connection(hosts=['127.0.0.1'])

# 生成analyzer
from elasticsearch_dsl.analysis import CustomAnalyzer as _CustomAnalyzer
class CustomAnalyzer(_CustomAnalyzer):
    def get_analysis_definition(self):
        return {}

c_analyzer = CustomAnalyzer('ik_max_word',filter=['lowercase'])

class LagouType(DocType):
    # 搜索建议
    suggest = Completion(analyzer=c_analyzer)

    url = Keyword()
    pname = Text(analyzer='ik_max_word')
    smoney = Integer()
    emoney = Integer()
    location = Keyword()
    syear = Integer()
    eyear = Integer()
    degree = Keyword()
    ptype = Keyword()
    tags = Text(analyzer='ik_max_word')
    date_pub = Date()
    advantage = Keyword()
    jobdesc = Text(analyzer='ik_smart')
    jobaddr = Keyword()
    company = Keyword()
    crawl_time = Date()

    class Meta:
        index = "py04"
        doc_type = "lagoutype"

if __name__ == '__main__':
    # 建表
    LagouType.init()