#面向对象的多线程方法
import threading
from queue import Queue


class MyThread(threading.Thread):
    def __init__(self,i,li):
        #调用父类初始化方法
        super(MyThread,self).__init__()
        #写自己的东西
        self.i=i
        self.li=li

    #线程启动的时候被调用
    def run(self):
        self.li.append(self.i)
        # print(self.i)

if __name__=='__main__':
    li = []
        #创建线程
    for i in range(10):
        t=MyThread(i,li)
        #启动线程
        t.start()
    print(li)