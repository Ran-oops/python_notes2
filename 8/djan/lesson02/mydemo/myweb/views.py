from django.shortcuts import render
from django.http import HttpResponse

from myweb.models import Users
def index(request):
	#return HttpResponse('hello world')
	lists=[{'id':101,'name':'lisi','sex':'m','age':20},
	      {'id':102,'name':'wangwu','sex':'w','age':21},
	      {'id':103,'name':'zhaoliu','sex':'w','age':22},
	      {'id':102,'name':'tianqi','sex':'m','age':23},
	]
	context={"name":"zhangsan",'list':lists}
	return render(request,"myweb/index.html",context)

def add(request,sid):
	return HttpResponse('add..'+str(sid))

def dels(request,mid):
        return HttpResponse('del..'+request.path+":"+str(mid))

def usersindex(request):
	#ob = Users.objects.get(id=3)
	#print(ob.name)

	#res=Users.objects.filter(name="zhangsan")
	#print(res)
	
	lists=Users.objects.all()
	context={"list":lists}
	return render(request,"myweb/users/index.html",context)

def userdel(request,uid):
	ob=Users.objects.get(id=uid)
	ob.delete()
	return HttpResponse("ok!")

