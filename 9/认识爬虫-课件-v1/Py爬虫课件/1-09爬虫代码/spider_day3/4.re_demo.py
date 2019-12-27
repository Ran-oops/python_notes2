import re

html = '''
<div>
    <ul>
        <li class="active" lsj id ="324234"
        >抽烟</li>
        <li>喝酒</li>
        <li>烫头</li>
        <li>洗脚</li>
    </ul>
</div>
'''

# 编译规则
# p1 = re.compile('<li.*?>(.*?)</li>',re.S)
#
# res = p1.findall(html)
# print(res)

# 匹配某一个标签，标签开始和结尾不在一行
div_p = re.compile(r'<div>.*</div>',re.S)
res = div_p.findall(html)
print(res)