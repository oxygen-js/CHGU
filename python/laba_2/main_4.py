a = int(input('a: '))
b = int(input('b: '))

numbers = []

for i in range(a, b + 1):
    if (i % 3 == 0):
        numbers.append(i)


print("Result =", sum(numbers) / len(numbers))
