import threading
import time
def foo():
    time.sleep(1)
    print(1)
t=threading.Thread(target=foo)
t.start()
print(2)
# print(t.is_alive())
#判断线程是否存活，如果存活则返回True,否则返回False
time.sleep(1.1)
print(t.is_alive())

