from django.shortcuts import render
from django.http import HttpResponse

from myadmin.models import Users
import time
# Create your views here.

def index(request):
    return render(request,"myadmin/index.html")

#================后台会员管理=================
#浏览会员

def usersindex(request): 
	#执行数据查询，并放置到模板中
	list = Users.objects.all()
	context = {"userslist":list}
	return render(request,'myadmin/users/index.html',context)
	

def usersadd(request):
	pass

def usersinsert(request):
	pass

def usersdel(request,uid):
	pass

def usersedit(request,uid):
	pass

def usersupdate(request,uid):
	pass

def login(request):
	return render(request,"myadmin/login.html")

def dologin(request):
	#获取登录信息
	username = request.POST.get('username','')
	upass = request.POST.get('password','')

	try:
		#从数据库中获取登录信息
		user = Users.objects.get(username=uname)
		if user.state == 0:
			#验证密码：
			import hashlib
			m = hashlib.md5()
			m.update(bytes(upass,encoding="utf8"))
			if user.password == m.hexdigest():
				#此处表示登录成功，将登录成功后的信息放入到session中
				request.session['adminuser']=user.toDict()
				return redirect(reverse('admin_index'))
			else:
				context={'info':'登录密码错误！'}
		else:
			context = {'info':'登录者不是后台管理员！'}
	except:
		context = {'info':'登录账号错误！'}
	return render(request,"myadmin/login.html",context)

def logout(request):
	del request.session['adminuser']
	return redirect(reverse('myadmin_login'))