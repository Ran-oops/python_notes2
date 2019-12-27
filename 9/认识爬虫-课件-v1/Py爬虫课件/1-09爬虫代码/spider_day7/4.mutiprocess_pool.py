from multiprocessing import Process,Pool # 进程池
import time

def foo(i):
    time.sleep(1)
    print(i)

if __name__ == '__main__':
    pool = Pool(4)

    for i in range(10):
        pool.apply_async(foo,args=(i,))

    pool.close() # 关闭以后就不能再创建新的进程了

    # 等待所有进程池的进程运行完毕
    pool.join()