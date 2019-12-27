from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from myadmin.models import Users

# Create your views here.
def index(request):
    return render(request,"myadmin/index.html")

# ==============后台会员管理======================
# 浏览会员
def usersindex(request):
    # 执行数据查询，并放置到模板中
    list = Users.objects.all()
    context = {"userslist":list}
    #return HttpResponse(list)
    return render(request,'myadmin/users/index.html',context)

# 会员信息添加表单
def usersadd(request):
    return render(request,'myadmin/users/add.html')

#执行会员信息添加    
def usersinsert(request):
    try:
        ob = Users()
        ob.username = request.POST['username']
        ob.name = request.POST['name']
        #获取密码并md5
        import hashlib
        m = hashlib.md5() 
        m.update(bytes(request.POST['password'],encoding="utf8"))
        ob.password = m.hexdigest()
        ob.sex = request.POST['sex']
        ob.address = request.POST['address']
        ob.code = request.POST['code']
        ob.phone = request.POST['phone']
        ob.email = request.POST['email']
        ob.state = 1
        ob.addtime = time.time()
        ob.save()
        context = {'info':'添加成功！'}
    except:
        context = {'info':'添加失败！'}

    return render(request,"myadmin/info.html",context)

# 执行会员信息删除
def usersdel(request,uid):
    try:
        ob = Users.objects.get(id=uid)
        ob.delete()
        context = {'info':'删除成功！'}
    except:
        context = {'info':'删除失败！'}
    return render(request,"myadmin/info.html",context)

# 打开会员信息编辑表单
def usersedit(request,uid):
    try:
        ob = Users.objects.get(id=uid)
        context = {'user':ob}
        return render(request,"myadmin/users/edit.html",context)
    except:
        context = {'info':'没有找到要修改的信息！'}
    return render(request,"myadmin/info.html",context)

# 执行会员信息编辑
def usersupdate(request,uid):
    try:
        ob = Users.objects.get(id=uid)
        ob.name = request.POST['name']
        ob.sex = request.POST['sex']
        ob.address = request.POST['address']
        ob.code = request.POST['code']
        ob.phone = request.POST['phone']
        ob.email = request.POST['email']
        ob.state = request.POST['state']
        ob.save()
        context = {'info':'修改成功！'}
    except:
        context = {'info':'修改失败！'}
    return render(request,"myadmin/info.html",context)

#===========管理员登录退出操作=========================
def login(request):
    return render(request,"myadmin/login.html")

def dologin(request):
    #获取登录信息
    uname = request.POST.get('username','')
    upass = request.POST.get('password','')
    code = request.POST.get('code','')

    #校验验证码
    if code != request.session['verifycode']:
        context = {'info':'验证码错误！'}
        return render(request,"myadmin/login.html",context)
    
    try:
        #从数据库中获取登录信息
        user = Users.objects.get(username=uname)
        if user.state == 0:
            # 验证密码
            import hashlib
            m = hashlib.md5() 
            m.update(bytes(upass,encoding="utf8"))
            if user.password == m.hexdigest():
                #此处表示登录成功，将登录成功后的信息放入到session中
                request.session['adminuser'] = user.toDict()
                return redirect(reverse('admin_index'))
            else:
                context = {'info':'登录密码错误！'}
        else:
            context = {'info':'登录者不是后台管理员！'}
    except:
        context = {'info':'登录账号错误！'}
    
    return render(request,"myadmin/login.html",context)

def logout(request):
    del request.session['adminuser']
    return redirect(reverse('myadmin_login'))

# 验证码绘制
def verifycode(request):
    #引入绘图模块
    from PIL import Image, ImageDraw, ImageFont
    #引入随机函数模块
    import random
    #定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100), random.randrange(
        20, 100), 255)
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
    #str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    str1 = '0123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象
    font = ImageFont.truetype('static/msyh.ttf', 23)
    #font = ImageFont.load_default().font
    #构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    #绘制4个字
    draw.text((5, -2), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, -2), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, -2), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, -2), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
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