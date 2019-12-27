#===========多进程资源共享消耗大，这个案例中并没有发生共享===============
'''
from multiprocessing import Process

li=[]

def foo(i):
    li.append(i)
    print(li)
if __name__=='__main__':
    for i in range(10):
        p=Process(target=foo,args=(i,))
        p.start()
    print(li)
'''
#================运行结果==================
'''
[]
[3]
[2]
[9]
[8]
[6]
[1]
[4]
[7]
[5]
[0]

Process finished with exit code 0
'''

#==========多进程实现数据共享======================

from multiprocessing import Process,Manager,Queue

def foo(i,q):
    q.put(i)

if __name__=='__main__':
    q= Queue()  #初始化一个队列

    pro_list=[]
    for i in range(10):
        p=Process(target=foo,args=(i,q))
        p.start()
        pro_list.append(p)

    for pro in pro_list:
        pro.join()

    #最后获取q的结果
    while not q.empty():
        print(q.get())
#========运行结果=====================================
#顺序是乱的，先进去的数先出来，由CPU决定
'''
3
7
0
4
6
2
8
9
1
5

Process finished with exit code 0
'''

