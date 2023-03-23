sqrt_numbers = []
sum_in_value = 0

while True:
    value = int(input())
    sum_in_value += value
    if (sum_in_value == 0):
        sqrt_numbers.append(value)
        break
    sqrt_numbers.append(value)


squared = map(lambda num: num ** 2, sqrt_numbers)
result = 0

for i in list(squared):
    result += i


print(result)
