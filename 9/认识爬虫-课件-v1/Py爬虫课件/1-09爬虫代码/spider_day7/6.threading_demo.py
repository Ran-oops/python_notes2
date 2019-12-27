import threading # 多线程模块
import time

def foo(i):
    time.sleep(1)
    print(i)

if __name__ == '__main__':
    time.clock()
    # 创建一个线程
    thread_list = []
    for i in range(10):
        t = threading.Thread(target=foo,args=(i,))
        # 线程启动前设置daemon
        t.setDaemon(True)

        # 启动一个线程
        t.start()
        # 线程join  阻塞进程
        thread_list.append(t)

    # 确保所有线程运行完毕，主进程继续运行
    # for t in thread_list:
    #     t.join()

    print('运行时间',time.clock())


    