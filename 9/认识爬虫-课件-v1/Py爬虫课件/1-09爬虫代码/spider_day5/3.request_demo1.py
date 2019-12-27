import requests

# 解决编码 乱码的问题
response = requests.get('http://www.itxdl.cn/activity/teacher/teacher_lieibiao/')
response.encoding = 'gbk'
print(response.text)