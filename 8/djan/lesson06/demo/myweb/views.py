from django.shortcuts import render
from django.http import HttpResponse

from myweb.models import Pic

#这个PIL是用于绘制图片 在这个案例中是用于添加水印，可以在浏览器输入 python PIL 水印
from PIL import Image

import time,os


# 网站首页
def index(request):
    return render(request,'myweb/index.html')

#==========在线相册处理视图函数==================
# 浏览相册图片信息信息
def indexpic(request):
	#执行数据查询，并放置到模板中
	list = Pic.objects.all()
	context = {"piclist":list}
	return render(request,"myweb/pic/index.html",context)

def addpic(request):
	return render(request,"myweb/pic/add.html")

def insertpic(request):
	#输出httpresponse的FILES属性的值
	#print(request.FILES)
	#print(request.FILES['mypic'])
	
	#======第一种写法start============	
	#读出上传的资料
	#bts = request.FILES[''].read()

    #打开文件，用wb+模式
	#ob = open("./static/pics/a.jpg","wb+")
	#写入bts
	#ob.write(bts)
	#关闭文件
	#ob.close()
	#return HttpResponse('ok!')
	#======第一种写法end=================


	#======第二种写法start===============
	# upfile = request.FILES.get('mypic',None)
	# if not upfile:
	# 	return HttpResponse('没有上传的文件')

	# bts = upfile.read()
	# ob = open("./static/pics/a.jpg","wb+")
	# ob.write(bts)
	# ob.close()
	# return HttpResponse("ok!")
	#======第二种写法end===============

	try:
		#======第三种写法start===============
		upfile = request.FILES.get('mypic',None)
		if not upfile:
			return HttpResponse('没有上传的文件')

		#随机生成一个文件名
		filename = str(time.time())+"."+upfile.name.split('.').pop()
		ob = open("./static/pics/"+filename,"wb+")

		#分块写入文件
		for chunk in upfile.chunks():
			ob.write(chunk)
		ob.close()
		#return HttpResponse('ok!')
		
		#======第三种写法end===============

		#执行图片缩放
		im =Image.open("./static/pics/"+filename)
		#缩放到375*375：
		im.thumbnail((75,75))
		#把缩放后的图像用jpeg格式保存：
		im.save("./static/pics/s_"+filename,None)
		

		#添加图片水印
		im = Image.open("./static/pics/"+filename)
		logoim = Image.open("./static/pics/logo.jpg")
		bw, bh = im.size
		lw, lh = logoim.size
		im.paste(logoim,(bw-lw,bh-lh))
		im.save("./static/pics/"+filename,None)

		#执行信息的添加
		ob = Pic()
		ob.name = request.POST['name']
		ob.age =  request.POST['age']
		ob.picname = filename
		ob.addtime = time.time()
		ob.save()
		context = {'info':'添加成功！'}

	except:
		context = {'info':'添加失败！'}
	return render(request,"myweb/pic/info.html",context)

	
def delpic(request,uid):
	try:
		ob = Pic.objects.get(id=uid)
		#执行图片删除
		os.remove("./static/pics/"+ob.picname)
		os.remove("./static/pics/s_"+ob.picname)
		#执行数据删除
		ob.delete()
		context = {'info':'删除成功！'}
	except:
		context = {'info':'删除失败'}
	return render(request,"myweb/pic/info.html",context)
	

def editpic(request,uid):
	try:
		ob = Pic.objects.get(id=uid)
		context = {'pic':ob}
		return render(request,"myweb/pic/edit.html",context)
	except:
		context = {'info':'没有找到需要修改的信息！'}
		return render(request,"myweb/pic/info.html",context)

#执行信息编辑操作

def updatepic(request):
	try:
		#获取原图片名
		oldpicname = request.POST['oldpicname']
		#判断是否有文件上传
		myfile = request.FILES.get('mypic',None)
		if not myfile:
			filename = oldpicname
		else:
			#执行上传处理
			filename = str(time.time())+"."+myfile.name.split('.').pop()
			print(filename);
			
			destination = open("./static/pics"+filename,"wb+")
			for chunk in myfile.chunks():
				destination.write(chunk)
			destination.close()
			#执行图片缩放
			im = Image.open("./static/pics/"+filename)
			#缩放到375*375：
			im.thumbnail((75,75))
			#把缩放后的图像用jpeg格式保存：
			im.save("./static/pics/s_"+filename,None)
		ob = Pic.objects.get(id=request.POST['id'])
		ob.name = request.POST['name']
		ob.age = request.POST['age']
		ob.picname = filename
		ob.save()
		context = {'info':'修改成功！'}
		#判断删除老照片
		if myfile:
			os.remove("./static/pics/"+oldpicname)
			os.remove("./static/pics/s_"+oldpicname)
	except:
		context = {'info':'修改失败！'}
		#判断删除刚刚上传的图片
		if myfile:
			os.remove("./static/pics/"+ picname)
			os.remove("./static/pics/s_"+ picname)
	return render(request,"myweb/pic/info.html",context)


'''
def updatepic(request):
    try:
        # 获取原图片名
        oldpicname = request.POST['oldpicname']
        # 判断是否有文件上传
        myfile = request.FILES.get("mypic", None)
        if not myfile:
            filename = oldpicname
        else:
            # 执行上传处理
            filename = str(time.time()) + "." + myfile.name.split('.').pop()
            destination = open("./static/pics/" + filename, "wb+")
            for chunk in myfile.chunks():  # 分块写入文件
                destination.write(chunk)
            destination.close()
            # 执行图片缩放
            im = Image.open("./static/pics/" + filename)
            # 缩放到375*375:
            im.thumbnail((75, 75))
            # 把缩放后的图像用jpeg格式保存:
            im.save("./static/pics/s_" + filename, None)

        ob = Pic.objects.get(id=request.POST['id'])
        # ob = Pic()
        ob.name = request.POST['name']
        ob.age = request.POST['age']
        ob.picname = filename
        ob.save()
        context = {'info': '修改成功！'}
        # 判断删除老图片
        if myfile:
            os.remove("./static/pics/" + oldpicname)
            os.remove("./static/pics/s_" + oldpicname)
    except:
        context = {'info': '修改失败！'}
        # 判断删除刚刚上传的图片
        if myfile:
            os.remove("./static/pics/" + ob.piname)
            os.remove("./static/pics/s_" + ob.piname)
    return render(request, "myweb/pic/info.html", context)
'''


	