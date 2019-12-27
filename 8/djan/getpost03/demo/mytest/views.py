from django.shortcuts import render
from django.http import HttpResponse
#重定向,
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

#,mytest.models 指的就是mytest文件夹下的models.py 导入里面的users类
from mytest.models import Users

# Create your views here.
#索引页
def index(request):
	return render(request,"mytest/index.html")

#==============get/post练习=============================
def demo01(request):
	return render(request,"mytest/demo01.html")

def myget(request):
	#get info
	uname=request.GET.get("uname")
	sex=request.GET['sex']
	year=request.GET['year']
	lists=request.GET.getlist('hobbies')
	return HttpResponse("uname:"+uname+"<br/>sex:"+sex+"<br/>year:"+year+"<br/>hobbies:"+":".join(lists))
def mypost(request):
	uname=request.POST.get("uname")
	sex=request.POST['sex']
	year=request.POST['year']
	lists=request.POST.getlist('hobbies')
	return HttpResponse("uname:"+uname+"<br/>sex:"+sex+"<br/>year:"+year+"<br/>hobbies:"+":".join(lists))

#============Users Demo======================
#定义的函数的名称就和url里面views.后面的名字一样，这样就不容易出错
def indexusers(request):
	lists=Users.objects.all()
	context={"list":lists}
	return render(request,"mytest/users/index.html",context)
	
#准备添加，把添加页面加载出来
def addusers(request):
	return render(request,"mytest/users/add.html")
#执行添加
def insertusers(request):
	#两种方法获取值
	#name=request.POST.get("name","aa")
	#name=request.POST["name"]
	try:
		#实例化对象
		ob=Users()
		#往这个对象中塞值
		ob.name=request.POST.get("name","")
		ob.age=request.POST.get("age",20)
		ob.phone=request.POST.get("phone","")
		#保存
		ob.save()
		context={"info":"save OK"}
	except:
		context={"info":"Error"}
	return render(request,"mytest/users/info.html",context)

def delusers(request,uid):
	ob=Users.objects.get(id=uid)
	ob.delete()
	#重定向，让它跳转到浏览页面上去
	return redirect(reverse('index_users'))

#准备修改，把数据查出来显示
def editusers(request,uid):
	ob=Users.objects.get(id=uid)
	if ob==None:
		return HttpResponse('No find info')
	context={"user":ob}
	return render(request,"mytest/users/edit.html",context)

#执行修改
def updateusers(request):
	
	ob=Users.objects.get(id=request.POST.get("id",0))
	ob.name=request.POST.get("name","")
	ob.age=request.POST.get('age',"")
	ob.phone=request.POST.get('phone',"")
	ob.save()
	context={"info":"Edit OK"}

		
	return render(request,"mytest/users/info.html",context)
