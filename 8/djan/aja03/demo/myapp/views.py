from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from myapp.models import District
# Create your views here.
def index(request):
    return render(request,'myapp/index.html')

# 加载城市级联信息操作模板
def showdistrict(request):
    return render(request,"myapp/district.html")

# 加载对应的城市信息，并json格式ajax方式响应
def district(request,upid):
    dlist = District.objects.filter(upid=upid)
    list = []
    for ob in dlist:
        list.append({'id':ob.id,'name':ob.name})
    return JsonResponse({'data':list})
