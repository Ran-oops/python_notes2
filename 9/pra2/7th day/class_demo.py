#=============简单demo========================
'''
class A:
    def __init__(self):
        self.a=1
class B:
    def __init__(self):
        self.b=2
b=B()
print(b.b)
print(b.a)  #结果会报错，没有a了
'''
#==============================================
class A:
    def __init__(self):
        self.a=1
class B:
    def __init__(self):
        super(B,self).__init__()
        self.a=2
b=B()
#print(b.b)  #没有b了。如果没有注释的话会报错！
print(b.a)  #a值被覆盖了


