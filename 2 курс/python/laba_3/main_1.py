numbers = input("Numbers: ").split(' ')
res = 0

for i in numbers:
    res += int(i)


print("Result: ", res)