from django.shortcuts import render
from django.http import HttpResponse
from jobs.models import Job51
from django.core.paginator import Paginator

# Create your views here.
def index(request):
    return render(request,"index.html")

#搜索&分页浏览
def job51list(request,pIndex):
    pIndex=int(pIndex)
    lists=Job51.objects.filter()  #获取信息对象
    #获取并判断是否添加date_time条件搜索
    # for i in lists:
    #     print(i.title)
    #     return HttpResponse('ok')
    # return HttpResponse(lists)
    where=[]#定义一个用于维持搜索条件的变量列表
    date_time=request.GET.get("date_time",'')
    if date_time !='':
        lists=lists.filter(date_time=date_time)
        where.append('date_time='+date_time)

    #获取并判断是否添加company条件搜索
    address=request.GET.get("address",'')
    if address != '':
        lists=lists.filter(address=address)
        where.append('address='+address)

    #通过信息创建分页对象
    p=Paginator(lists,100)

    #判断页号，防止越界
    if pIndex>p.num_pages:  #p.num_pages是总页数
        pIndex=p.num_pages
    if pIndex<1:
        pIndex=1

    #获取指定pIndex页的数据
    list2=p.page(pIndex)
    plist=p.page_range  #p.page_range总页数的范围，是列表
    max=plist[-1]
    #将结果放置到模板中
    context={'list':list2,'plist':plist,'pIndex':pIndex,'where':where,'max':max}

    return render(request,'jobs/job51/joblist.html',context)


def job51detail(request,rowindex):
    info=Job51.objects.all()
    for i in info:
        return HttpResponse(i.detail)

