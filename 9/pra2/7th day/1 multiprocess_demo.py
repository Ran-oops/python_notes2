#===========主进程是整个代码，子进程是if __name__=='__main__'的部分=================
#==========在这种情况下，主进程没有等待子进程就先全部执行============================
'''
import multiprocessing
from multiprocessing import Process
import time

#进程函数
def foo(i):
    time.sleep(1)
    print(i)

#创建进程一定要在__name__=__main__条件成立下
if __name__=='__main__':
    #默认情况下，主进程等待所有子进程运行完毕
    print(time.ctime())

    for i in range(10):
        #创建一个子进程
        p=Process(target=foo,args=(i,))

        p.start()#启动子进程

    print(time.ctime())
'''
#==========结果===========================================
'''
Thu Aug  2 09:12:33 2018
Thu Aug  2 09:12:33 2018
3
2
6
1
7
9
0
5
4
8

Process finished with exit code 0

'''
#==============================================================

#========================
'''
import multiprocessing
from multiprocessing import Process
import time

#进程函数
def foo(i):
    time.sleep(1)
    print(i)

#创建进程一定要在__name__=__main__条件成立下
if __name__=='__main__':
    #默认情况下，主进程等待所有子进程运行完毕
    print(time.ctime())
    for i in range(10):
        #创建一个子进程
        p=Process(target=foo,args=(i,))
       #p.join一定要在p.start的后面
        p.start()#启动子进程
        p.join()   #对主进程形成阻塞，也就是说会等待第一个子进程运行完了才再循环创建一个子进程，
    #这种方法就不合理。正确的应该是先把所有子进程都创建完毕才去阻塞主进程
    print(time.ctime())
'''
#=============运行结果===========================================================
'''
Thu Aug  2 09:14:15 2018
0
1
2
3
4
5
6
7
8
9
Thu Aug  2 09:14:28 2018

Process finished with exit code 0

'''
#==========================正确的多进程方法=========================
'''
import multiprocessing
from multiprocessing import Process
import time

#进程函数
def foo(i):
    time.sleep(1)
    print(i)

#创建进程一定要在__name__=__main__条件成立下
if __name__=='__main__':
    #默认情况下，主进程等待所有子进程运行完毕
    print(time.ctime())

    pro_list=[]
    for i in range(10):
        #创建一个子进程
        p=Process(target=foo,args=(i,))
       #p.join一定要在p.start的后面
        p.start()#启动子进程
        pro_list.append(p)#将子进程收集起来

    for pro in pro_list:
        pro.join()  #将所有子进程都join在一起

    print(time.ctime())
'''
#===================运行结果================================
#很明显，运行时间变少了！
'''
Thu Aug  2 09:19:01 2018
3
0
8
6
7
9
4
1
5
2
Thu Aug  2 09:19:04 2018

Process finished with exit code 0
'''
#====================================================================

#===========daemon的使用=============================================
import multiprocessing
from multiprocessing import Process
import time

#进程函数
def foo(i):
    time.sleep(1)
    print(i)

#创建进程一定要在__name__=__main__条件成立下
if __name__=='__main__':
    #默认情况下，主进程等待所有子进程运行完毕
    print(time.ctime())

    pro_list=[]
    for i in range(10):
        #创建一个子进程
        p=Process(target=foo,args=(i,))
       #p.join一定要在p.start的后面

        pro_list.append(p)#将子进程收集起来
        p.daemon=True  #默认daemon是False,等待子进程。如果设置为True,主进程不等待子进程
        p.start()  # 启动子进程

    # for pro in pro_list:
    #     pro.join()  #将所有子进程都join在一起

    print(time.ctime())
#================================================================
#=========运行结果===============================================
'''
Thu Aug  2 09:42:44 2018
Thu Aug  2 09:42:44 2018

Process finished with exit code 0
'''
#===============================================================

