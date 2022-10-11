x = 0
N = input("N: ")

for i in N:
    value = int(i)
    if (value % 2 == 0):
        x = x + value ** 2


print(x)
