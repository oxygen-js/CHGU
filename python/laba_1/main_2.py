import math

x = int(input("x: "))

if (x <= 1):
    print(-3 * x ** 3 + 9)

if ((1 < x) and (x < 10)):
    print(-1 * (3 / x + 1))

if (x >= 10):
    print(-1 * math.sin(2 * math.pi * x) + math.cos(3 * math.pi * x))
    

