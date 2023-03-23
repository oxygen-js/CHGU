import math

x = float(input('x: '))
k = float(input('k: '))
j = float(input('j: '))
m = range(int(input('m: ')), 1)

result = (2 * x ** 2) + math.prod(m) * (x + k) + x * math.fsum(m) * j ** 3 + 2
print("Result =", result)
