import jsonpath,requests
import json

response = requests.get('https://www.lagou.com/lbs/getAllCitySearchLabels.json')

json_data = response.text
json_data = json.loads(json_data) # 先转成字典

# res = jsonpath.jsonpath(json_data,'$..name')
res = jsonpath.jsonpath(json_data,'$..allCitySearchLabels.*.*')

for city in res:
    print(city)