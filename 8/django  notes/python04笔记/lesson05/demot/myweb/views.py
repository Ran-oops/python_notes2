from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator

from myweb.models import Stu

# Create your views here.
def index(request):
    return render(request,"myweb/index.html")


#===========学生信息的搜索加分页=================
#浏览全部
def stu(request):
    lists = Stu.objects.all()
    context = {"list":lists}
    return render(request,"myweb/stu/index1.html",context)

#分页浏览
def stupage(request,pIndex):
    pIndex = int(pIndex)
    #获取信息对象
    lists = Stu.objects.all()

    # 通过信息创建分页对象
    p = Paginator(lists, 4)
    
    #判断页号，防止越界
    if pIndex > p.num_pages:
        pIndex = p.num_pages
    if pIndex < 1:
        pIndex = 1
    # 获取指定pIndex页的数据
    list2 = p.page(pIndex)
    plist = p.page_range
    # 将结果放置模板中
    context = {"list":list2,'plist':plist, 'pIndex':pIndex}
    return render(request,"myweb/stu/index2.html",context)

#搜索浏览
def stusearch(request):
    lists = Stu.objects.filter()
    print(lists)
    #获取并判断是否添加name条件搜索
    name = request.GET.get("name",'')
    if name != '':
        lists = lists.filter(name__contains=name)
        print(lists)
    #获取并判断是否添加sex条件搜索
    sex = request.GET.get("sex",'')
    if sex != '':
        lists = lists.filter(sex=sex)

    context = {"list":lists}
    return render(request,"myweb/stu/index3.html",context)

#搜索&分页浏览
def stuspage(request,pIndex):
    pIndex = int(pIndex) #处理页号为整型
    lists = Stu.objects.filter()
    #获取并判断是否添加name条件搜索
    where = [] #定义一个用于维持搜索条件的变量列表
    name = request.GET.get("name",'')
    if name != '':
        lists = lists.filter(name__contains=name)
        where.append('name='+name)
    #获取并判断是否添加sex条件搜索
    sex = request.GET.get("sex",'')
    if sex != '':
        lists = lists.filter(sex=sex)
        where.append('sex='+sex)

    # 通过信息创建分页对象
    p = Paginator(lists, 4)
    
    #判断页号，防止越界
    if pIndex > p.num_pages:
        pIndex = p.num_pages
    if pIndex < 1:
        pIndex = 1

    # 获取指定pIndex页的数据
    list2 = p.page(pIndex)
    plist = p.page_range
    # 将结果放置模板中
    context = {"list":list2,'plist':plist, 'pIndex':pIndex,"where":where}
    return render(request,"myweb/stu/index4.html",context)


def demo1(request):
    #response = HttpResponse()
    #response.set_cookie("username","zhangwuji",20*24*3600)
    #print(request.COOKIES.get("username",""))

    # 尝试从cookie中获取class样式，默认为C1
    cname = request.COOKIES.get("classname","c1") 
    # 放置到模板中
    context = {"classname":cname}
    return render(request,"myweb/demo1.html",context)

def setCC(request):
    response = HttpResponse("<script>window.location='/demo1'</script>")
    cc = request.GET.get("cname","")
    print(cc)
    if cc != "":
        response.set_cookie("classname",cc,3600)
    return response

# session的计数器
def demo2(request):
    num = request.session.get("num",0)
    num += 1
    request.session['num'] = num
    return HttpResponse("计数器的值："+str(num))

#===============session的购物车案例===============================
def shop(request):
    return render(request,"myweb/shop/index.html")

def addcart(request):
    #获取要购买的商品信息
    shop = {}
    sid = request.POST.get("id")
    shop['id'] = sid
    shop['name'] = request.POST.get("name")
    shop['price'] = float(request.POST.get("price"))
    shop['m'] = 1 #默认追加一个为1的购买量
    # 从session中获取购物车
    shoplist = request.session.get("shoplist",{})

    #判断购物车中是否存在当前购买商品
    if sid in shoplist:
        shoplist[sid]['m'] += 1 #若存在，购买量加1
    else:
        # 将商品shop放入购物车shoplist中
        shoplist[sid] = shop

    # 将购物车shoplist放入session中
    request.session['shoplist'] = shoplist
    # 加载模板
    return render(request,"myweb/shop/showcart.html")

def showcart(request):
    return render(request,"myweb/shop/showcart.html")

def delcart(request,sid):
    # 从session中获取购物车
    shoplist = request.session.get("shoplist",{})
    # 从购物车shoplist中删除一个商品
    del shoplist[sid]
    # 将购物车shoplist放入session中
    request.session['shoplist'] = shoplist
    return render(request,"myweb/shop/showcart.html")

def clearcart(request):
    del request.session['shoplist']
    return render(request,"myweb/shop/showcart.html")