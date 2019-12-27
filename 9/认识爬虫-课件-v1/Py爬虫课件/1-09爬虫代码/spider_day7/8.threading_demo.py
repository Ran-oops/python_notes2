import threading
import time
from queue import Queue # 线程安全的，同一时间只能被一个线程访问

count = 0 # 线程不安全的

def foo():
    global count
    count += 1

t_list = []
for i in range(10000):
    t = threading.Thread(target=foo)
    t_list.append(t)

for t in t_list:
    t.start()
    print(count)