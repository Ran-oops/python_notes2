import re
import time

time.sleep()

content = '124324python.com.python.com'

p1 = re.compile('.+python')

res = p1.search(content)

print(res.group())