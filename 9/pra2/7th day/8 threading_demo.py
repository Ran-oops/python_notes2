import threading
import time
from queue import Queue #线程是安全的，同一时间只能被一个线程访问

count=0  #线程不安全
def foo():
    global count
    time.sleep(1)
    count+=1
    print(count)

t_list=[]
for i in range(100):
    t=threading.Thread(target=foo)
    t_list.append(t)

for t in t_list:
    t.start()