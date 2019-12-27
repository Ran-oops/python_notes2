from lxml import etree

html = '''
<title id=''></title>
<div class='content' content='c432235235'>
    <ul id='u1' class="u2">
         <li class="item-0"><a class='active' href="link1.html">first item</a></li>
         <li class="item-1"><a href="link2.html">second item</a></li>
         <li class="item-inactive"><a href="link3.html">third item</a></li>
         <li class="item-1"><a href="link4.html">fourth item</a></li>
         <li class="item-0"><a href="link5.html">fifth item</a> # 注意，此处缺少一个 </li> 闭合标签
     </ul>
    <ul id='u2' class="u2class">
         <li class="item-0"><a class='active' href="link1.html">first item</a></li>
         <li class="item-1"><a href="link2.html">second item</a></li>
         <li class="item-inactive"><a href="link3.html">third item</a></li>
         <li class="item-1"><a href="link4.html">fourth item</a></li>
         <li class="item-0"><a href="link5.html">fifth item</a> # 注意，此处缺少一个 </li> 闭合标签
     </ul>
 </div>
<div class='foot' content=''>
    <p></p>
</div> 
'''

html = etree.HTML(html)  # 返回xpath 对象，支持xpath规则进行匹配

# 构建xpath规则

#res=html.xpath('//ul')

#res = html.xpath('//ul/li/a/text()')  # 获取标签下的文本

#res = html.xpath('//ul/li/a/@class')  # 获取标签的属性

#res = html.xpath('//ul[@class="u2"]/@id')


# res = html.xpath('//div[@class="content"]')[0]  # 返回列表，拿到第一个
# ul_list = res.xpath('./ul')  # 选取当前节点然后匹配ul
#print(ul_list)
# for ul in ul_list:
#     li_list = ul.xpath('./li')
#     print(li_list)

# res = html.xpath('//div[@content]')  # 选取所有包含 content的属性的节点,虽然content是自定义的！

# res = html.xpath('//div/*')

res = html.xpath('//title[@*] | //div[@class="foot"]')  # 或者，取并集
print(res)