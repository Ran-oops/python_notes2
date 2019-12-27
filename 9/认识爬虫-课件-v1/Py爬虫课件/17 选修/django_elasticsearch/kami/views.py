from django.shortcuts import render,HttpResponse
from django.views.generic import View
# Create your views here.
from kami.models import LagouType
from elasticsearch import Elasticsearch
import json

# 连接到es
es_client = Elasticsearch(hosts=['127.0.0.1'])

# 搜索建议
class Suggest(View):
    def get(self,request):
        keyword = request.GET.get('s',None)
        res = [] # 结果列表
        if keyword: # 关键字存在
            es_type = LagouType.search()
            es_type = es_type.suggest('my_suggest',keyword,completion={
                "field": "suggest",
                "fuzzy": {
                    ""
                    "fuzziness": 2
                },
                "size" : 10
            })
            suggestions = es_type.execute_suggest() # 如果没有结果返回None
            if hasattr(suggestions,'my_suggest'):
                for source in suggestions.my_suggest[0].options:
                    source = source._source
                    res.append(source['pname'])
        return HttpResponse(json.dumps(res),content_type='application/json')


    def post(self,request):
        pass

class Search(View):
    def get(self,request):
        keyword = request.GET.get('q',None) # 获取搜索关键词
        page = request.GET.get('p',1)

        # page转换成整形
        try:
            page = int(page)
        except:
            page = 1

        # 搜索功能
        response = es_client.search(
            index='py04',
            body={
                    "query": {
                        "multi_match": {
                            "query": keyword,
                            "fields": ["pname^5", "tags","jobdesc^2"]
                        }
                    },
                    # "_source": ["pname", "jobdesc"],

                    "highlight": {
                        "pre_tags": ["<span class='keyWord'>"],
                        "post_tags": ["</span>"],
                        "fields": {
                            "pname": {},
                            "jobdesc": {}
                        }
                    },
                    "from": (page - 1) * 10,
                    "size": 10
                }
        )
        # print(response)
        total_num = response['hits']['total']
        res = []
        for hit in response['hits']['hits']:
            source = hit['_source']
            if 'highlight' in hit: # 判断是否存在highlight
                if hit['highlight'].get('pname',None): # 职位名称是否存在高亮
                    source['pname'] = ''.join(hit['highlight']['pname'])
                if hit['highlight'].get('jobdesc',None): # 职位描述是否存在高亮
                    source['jobdesc'] = ''.join(hit['highlight']['jobdesc'])[:500]

                source['score'] = hit['_score']
            res.append(source)

        context = {
            'data' : res,
            'keyword' : keyword,
            'page' : page,
            'total_num' : total_num
        }
        return render(request,'result.html',context=context)