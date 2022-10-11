a = int(input('a: '))
b = int(input('b: '))
c = int(input('c: '))
d = int(input('d: '))

head = ""
for i in range(a, b + 1):
    head += '\t' + str(i)

print(head)

for i in range(c, d + 1):
    stroked = ""
    for j in range(a, b + 1):
        stroked += '\t' + str(i * j)
    print(i, stroked)
