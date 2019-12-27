import re

# content = r'\n,_www.a12323534534634636\npython.org'
# content = r'\\\\'

content = ',2123re234@qq.com'

# 编译一个规则
# p1 = re.compile('\D\d\W')
# p1 = re.compile('\d?\d') #
# p1 = re.compile(r'\\+')
# p1 = re.compile(r'[0-9a-zA-Z]+')
p1 = re.compile(r'(\w+@.*)(cn|com)$')

# 匹配成功返回匹配内容，否则返回None
# res = p1.match(content)
#
# if res is not None: # 匹配成功
#     # 获取匹配内容
#     str1 = res.group(0)
#     print(str1)
# else: # 匹配失败
#     print('无匹配项')