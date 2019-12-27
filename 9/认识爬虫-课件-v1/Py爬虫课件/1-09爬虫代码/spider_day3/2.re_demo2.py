import re

content = '123lk##j3343k#k343'

p1 = re.compile('\d+')

# 返回列表，如果匹配不到返回空列表
res = p1.finditer(content)

for item in res:
    print(item.group())