import multiprocessing
from multiprocessing import Process
import time

# 进程函数
def foo(i):
    time.sleep(1)
    print(i)

# 创建进程一定要在 __name__ == __main__ 条件成立下
if __name__ == '__main__':
    # 默认形况下，主进程等待所有子进程城运行完毕
    print(time.ctime())

    pro_list = []
    for i in range(10):
        #创建一个子进程
        p = Process(target=foo,args=(i,))
        pro_list.append(p)
        p.daemon = False  # 默认daemon 是False，等待子进程   如果设置为True,主进程不等子进程
        p.start()

    # 等待所有子进程运行完毕才继续执行
    for pro in pro_list:
        pro.join()

    print(time.ctime())
