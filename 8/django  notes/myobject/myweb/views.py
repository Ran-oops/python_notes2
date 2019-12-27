from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from myweb.models import Users,Types,Goods

# 公共信息加载
def loadinfo(request):
    context = {}
    lists = Types.objects.filter(pid=0)
    context['typelist'] = lists
    return context
# 网站前台商品展示
# 首页
def index(request):
    context = loadinfo(request)
    return render(request,'myweb/index.html',context)

# 商品列表
def lists(request):
    context = loadinfo(request)
    lists = Goods.objects.filter()
    #判断添加搜索条件
    tid = int(request.GET.get('tid',0))
    if tid > 0:
    	lists = lists.filter(typeid__in=Types.objects.only('id').filter(pid=tid))
    
    context['goodslist'] = lists
    return render(request,'myweb/list.html',context)

# 商品详情
def detail(request,gid):
    context = loadinfo(request)
    ob = Goods.objects.get(id=gid)
    ob.clicknum += 1 # 点击量加1
    ob.save()
    context['goods'] = ob
    return render(request,'myweb/detail.html',context)


# 会员登录表单
def login(request):
    return render(request,'myweb/login.html')

# 会员执行登录
def dologin(request):
    # 校验验证码
    verifycode = request.session['verifycode']
    code = request.POST['code']
    if verifycode != code:
        context = {'info':'验证码错误！'}
        return render(request,"myweb/login.html",context)
        
    try:
        #根据账号获取登录者信息
        user = Users.objects.get(username=request.POST['username'])
        #判断当前用户是否是后台管理员用户
        if user.state == 0 or user.state == 1:
            # 验证密码
            import hashlib
            m = hashlib.md5() 
            m.update(bytes(request.POST['password'],encoding="utf8"))
            if user.password == m.hexdigest():
                # 此处登录成功，将当前登录信息放入到session中，并跳转页面
                request.session['vipuser'] = user.toDict()
                return redirect(reverse('index'))
            else:
                context = {'info':'登录密码错误！'}
        else:
            context = {'info':'此用户为非法用户！'}
    except:
        context = {'info':'登录账号错误！'}
    return render(request,"myweb/login.html",context)

# 会员退出
def logout(request):
    # 清除登录的session信息
    del request.session['vipuser']
    # 跳转登录页面（url地址改变）
    return redirect(reverse('login'))