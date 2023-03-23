# Найти все трехзначные числа, сумма цифр которых равна данному целому числу. 
x = int(input("x: "))
number_list = []


for i in range(100, 1000):
    n_sum = sum(map(int, list(str(i)))) 
    if (x == n_sum):
        number_list.append(i)


if (len(number_list) > 0):
    print(number_list)
else:
    print("Числа не найдены")


