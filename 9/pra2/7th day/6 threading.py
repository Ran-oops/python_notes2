#===========简单的线程demo====================================
'''
import threading  #多线程模块

def foo():
    print(123)

#创建一个线程
t=threading.Thread(target=foo)

#启动一个线程
t.start()
'''
#============循环创建线程,速度很快，一下子全出来========================================
'''
import threading  #多线程模块
import time
def foo(i):
    time.sleep(1)
    print(i)

#创建一个线程
for i in range(10):
    t=threading.Thread(target=foo,args=(i,))

    #启动一个线程
    t.start()
'''
#=====================速度慢，一个一个出来=======================================
'''
import threading  #多线程模块
import time
def foo(i):
    time.sleep(1)
    print(i)

#创建一个线程
for i in range(10):
    t=threading.Thread(target=foo,args=(i,))

    #启动一个线程
    t.start()
    t.join()  #线程join  阻塞进程
'''

#=============================================================================
'''
import threading  #多线程模块
import time
def foo(i):
    time.sleep(1)
    print(i)

if __name__=='__main__':
    time.clock()
    #创建一个线程
    thread_list=[]
    for i in range(10):
        t=threading.Thread(target=foo,args=(i,))
        #启动一个线程
        t.start()
        thread_list.append(t)
    
    #确保所有线程运行完毕，主进程继续运行
    for t in thread_list:
        t.join()

    print('运行时间：',time.clock())
'''
#====================运行结果============================================
'''
1
0
3
4
8
7
5
9
2
6
运行时间： 1.0078449327223389#有t.join()就是所有线程都完毕了，主进程才结束，所以时间最后输出

Process finished with exit code 0
'''
#==========================如果没有t.join()===============================
'''
import threading  # 多线程模块
import time


def foo(i):
    time.sleep(1)
    print(i)


if __name__ == '__main__':
    time.clock()
    # 创建一个线程
    thread_list = []
    for i in range(10):
        t = threading.Thread(target=foo, args=(i,))
        # 启动一个线程
        t.start()
        thread_list.append(t)

    # 确保所有线程运行完毕，主进程继续运行
    # for t in thread_list:
    #     t.join()

    print('运行时间：', time.clock())
'''
#=============================运行结果=====================================================
'''
运行时间： 0.0055351846125080715
0
1
3
2
5
4
6
7
9
8

Process finished with exit code 0
'''
#=================================================================================
#=================================================================================
#daemon的属性和t.join相矛盾，所以要测试daemon就要把t.join注释掉
import threading  # 多线程模块
import time


def foo(i):
    time.sleep(1)
    print(i)


if __name__ == '__main__':
    time.clock()
    # 创建一个线程
    thread_list = []
    for i in range(10):
        t = threading.Thread(target=foo, args=(i,))
        #线程启动前设置daemon
        t.setDaemon(True)  #不会等待，可以设成False和True

        # 启动一个线程
        t.start()
        thread_list.append(t)

    # 确保所有线程运行完毕，主进程继续运行
    # for t in thread_list:
    #     t.join()

    print('运行时间：', time.clock())
