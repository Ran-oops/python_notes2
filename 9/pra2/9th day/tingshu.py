import requests

response = requests.get('http://www.ting56.com/video/4704-0-0.html')
response.encoding = 'gbk'
html = response.text
print(html)