N0 = 200
S0 = 3000
precent = 200 / 10

K = int(input("Day = "))

for x in range(K):
    N0 += precent


print("shares$ =", N0)
print("cost$ =", N0 * S0, "$")