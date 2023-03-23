number = int(input("n = "))
count = 0

res = ""

for i in range(number):
    if count >= number: 
        break
    for j in range(i):
        res += str(i) + " "
        count += 1
        if count >= number: 
            break


print("Result: ", res)