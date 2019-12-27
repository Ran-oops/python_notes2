from django.shortcuts import redirect
from django.urls import reverse

import re

class AdminMiddleware(object):
	def __init__(self,get_response):
		self.get_response = get_response
	def __call__(self,request):
		urllist=['/myadmin/login','/myadmin/dologin','/myadmin/logout','/myadmin/verifycode']
		path=request.path
		if re.match("/myadmin",path) and (path not in urllist):
			if "adminuser" not in request.session:
				return redirect(reverse("myadmin_login"))
		
		response=self.get_response(request)
		return response
