from greenlet import greenlet

def foo1():
    print(12)
    print(34)

def foo2():
    print(56)
    print(78)
    c1.switch()

c1=greenlet(foo1)
c2=greenlet(foo2)
c2.switch()