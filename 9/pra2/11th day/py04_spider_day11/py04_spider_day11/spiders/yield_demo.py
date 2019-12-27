#如果函数中出现yield关键字，函数被调用则返回生成器对象
def foo():
    for i in range(3):
        yield i  #如果生成器被唤醒则用yield返回一个值，并且挂起

if __name__=='__main__':
    gen=foo()
    #next(生成器)唤醒生成器
    print(next(gen))


    #迭代一个生成器
    for i in gen:
        print(i)