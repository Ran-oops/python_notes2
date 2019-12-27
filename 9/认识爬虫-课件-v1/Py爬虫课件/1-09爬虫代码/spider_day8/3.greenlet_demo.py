from greenlet import greenlet

def foo1():
    print(12)
    c2.switch()
    print(34)
    c2.switch()

def foo2():
    print(56)
    c1.switch()
    print(78)


c1 = greenlet(foo1)
c2 = greenlet(foo2)

c1.switch()