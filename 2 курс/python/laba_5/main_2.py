N = list(map(int, input("N (1 - #14): ").split()))
result = dict.fromkeys(N, [])

for i in result:
    num = int(i)
    for j in range(num + 1):
        divider = int(j)
        if divider == 1 or divider == 0:
            continue
        if (num % divider) == 0:
            result[i] = result[i] + [j]
    print(i, "-", result[i])
