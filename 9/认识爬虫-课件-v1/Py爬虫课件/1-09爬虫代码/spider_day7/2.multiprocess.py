from multiprocessing import Process,Manager,Queue
# from queue import Queue

def foo(i,q):
    q.put(i)
    #print()
if __name__ == '__main__':
    q = Queue() # 初始化一个队列

    pro_list = []
    for i in range(10):
        p = Process(target=foo,args=(i,q))
        p.start()
        pro_list.append(p)

    for pro in pro_list:
        pro.join()

    # 最后获取q的结果
    while not q.empty():
        print(q.get())