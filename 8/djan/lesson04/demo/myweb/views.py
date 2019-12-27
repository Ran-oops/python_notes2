from django.shortcuts import render
from django.http import HttpResponse
from myweb.models import stu

# Create your views here.

#索引页
def index(request):
    return render(request,"myweb/index.html")

#输出各种内容信息
def demo1(request):
	#定义一个变量，放置信息，用于在模板中输出
	context = {"name":"ZhangSan"}
	
	#追加信息
	context['age']=20 


	context['arr']=["aa","bb","cc"]
	context['arr'].append("dd")
	print(context['arr'][0])

	context['stu']={"name":"wangwu",'age':21,"classid":"python04"}
	print(context['stu']['name'])


	#获取stu表数据中的单条数据
	ob=stu.objects.get(id=1)
	print(ob.name)
	ob.city="北京"
	context['vstu']=ob

	context['htmlinfo'] = "<h2>AAAAAAAAAAA</h2>"
	context['loginname']="张三丰"

	return render(request,"myweb/demo1.html",context)

#模板继承实例 小demo
def demo2(request):
	return render(request,"myweb/demo2.html")

#网页模板继承实例
def shopindex(request):
    return render(request,"myweb/shop/index.html")

def shoplist(request):

    return render(request,"myweb/shop/list.html")

def shopdetail(request):
    return render(request,"myweb/shop/detail.html")



def verifycode(request):
    #引入绘图模块
    from PIL import Image, ImageDraw, ImageFont
    #引入随机函数模块
    import random
    #定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100), random.randrange(20, 100), 200)
    #bgcolor = (168,230,172)
    width = 100
    height = 25
    #创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    #创建画笔对象
    draw = ImageDraw.Draw(im)
    #调用画笔的point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    #定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    #str1 = '0123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象
    font = ImageFont.truetype('./static/msyh.ttf', 23)
    #font = ImageFont.load_default().font
    #构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    #绘制4个字
    draw.text((5, -1), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 1), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, -2), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, 1), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
    print("code:"+rand_str)
    #内存文件操作
    """
    python2的为
    # 内存文件操作
    import cStringIO
    buf = cStringIO.StringIO()
    """
    # 内存文件操作-->此方法为python3的
    import io
    buf = io.BytesIO()
    #将图片保存在内存中，文件类型为png
    im.save(buf, 'png')
    #将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(buf.getvalue(), 'image/png')