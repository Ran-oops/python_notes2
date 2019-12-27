'''
from multiprocessing import Process,Pool  #进程池
import time
def foo(i):
    time.sleep(1)
    print(i)

if __name__=='__main__':
    pool=Pool(4)#进程池Pool中有几个就表示最多能容纳几个进程。进程池管理进程数，帮进程分配任务，谁干完了，谁就回来继续做下一个
    #任务

    for i in range(10):
        pool.apply(foo,args=(i,))  #阻塞性的，结果会慢慢一个一个出来.这是同步的
'''
#============运行结果===================================================
'''
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

Process finished with exit code 0

'''
#============异步的，4个一起出来的=====================================
from multiprocessing import Process,Pool  #进程池
import time
def foo(i):
    time.sleep(1)
    print(i)

if __name__=='__main__':
    pool=Pool(4)#进程池Pool中有几个就表示最多能容纳几个进程。进程池管理进程数，帮进程分配任务，谁干完了，谁就回来继续做下一个
    #任务

    for i in range(10):
        pool.apply_async(foo,args=(i,))  #阻塞性的，结果会慢慢一个一个出来.这是同步的

    pool.close()  #关闭之后就不能再创建新的进程了

    #等待所有进程池的进程运行完毕
    pool.join()

