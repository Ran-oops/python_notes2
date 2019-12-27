import gevent
from gevent import monkey
#打补丁，替换系统标准库中的模块
monkey.patch_all()
import time

#协程函数
def foo1(i):
    time.sleep(1)
    print(i)

g_list=[]
for i in range(10):
    g=gevent.spawn(foo1,i)
    g_list.append(g)
print(time.ctime())
gevent.joinall(g_list)
print(time.ctime())