from django.shortcuts import render
from django.http import HttpResponse,HttpResponseNotFound,JsonResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from mytest.models import Users,District
# Create your views here.

def index(request):
    return render(request,"mytest/index.html") 

#==============GET/POST======================
def demo01(request):
    return render(request,"mytest/demo01.html")

def myget(request):
    #get info
    uname = request.GET.get("uname")
    sex = request.GET['sex']
    year = request.GET['year']
    lists = request.GET.getlist("likes")
    return HttpResponse("uname:"+uname+"<br/> sex:"+sex+"<br/> year => "+year+"<br/> likes => "+":".join(lists))

def mypost(request):
    uname = request.POST.get("uname")
    sex = request.POST['sex']
    year = request.POST['year']
    lists = request.POST.getlist("likes")
    return HttpResponse("uname:"+uname+"<br/> sex:"+sex+"<br/> year => "+year+"<br/> likes => "+":".join(lists))

#============Users Demo======================
def indexusers(request):
    lists = Users.objects.all()
    context = {"list":lists}
    return render(request,"mytest/users/index.html",context)

def addusers(request):
    return render(request,"mytest/users/add.html")
    #return HttpResponseNotFound('<h1>Page not found</h1>')

def insertusers(request):
    #name = request.POST.get("name2","aa")
    #name = request.POST['name2']
    try:
    	ob = Users()
    	ob.name = request.POST.get("name","")
    	ob.age = request.POST.get("age",20)
    	ob.phone = request.POST.get("phone","")
    	ob.save()
    	context = {"info":"save OK"}
    except:
    	context = {"info":"Error"}
    return render(request,"mytest/users/info.html",context)

def delusers(request,uid):
    ob = Users.objects.get(id=uid)
    ob.delete()
    return redirect(reverse('index_users'))

def editusers(request,uid):
    ob = Users.objects.get(id=uid) # select * from mytest_users where id=uid
    if ob == None:
    	return HttpResponse("No find info")
    context = {'user':ob}
    return render(request,"mytest/users/edit.html",context)

def updateusers(request):
    try:
    	ob = Users.objects.get(id=request.POST["id"])
    	ob.name = request.POST["name"]
    	ob.age = request.POST.get("age")
    	ob.phone = request.POST.get("phone")
    	ob.save()
    	context = {"info":"Edit OK"}
    except:
    	context = {"info":"Error"}
    return render(request,"mytest/users/info.html",context)

# 加载城市级联信息操作模板
def showdistrict(request):
    return render(request,"mytest/district.html")

# 加载对应的城市信息，并json格式ajax方式响应
def district(request,upid):
    dlist = District.objects.filter(upid=upid)
    list = []
    for ob in dlist:
        list.append({'id':ob.id,'name':ob.name})
    return JsonResponse({'data':list})