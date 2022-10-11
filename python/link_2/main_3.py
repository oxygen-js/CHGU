a = int(input('a: '))
b = int(input('b: '))
c = int(input('c: '))
d = int(input('d: '))

head = ""
for i in range(a, b):
    head += '\t' + str(i)

print(head)

for i in range(c, d):
    stroked = ""
    for j in range(a, b):
        stroked += '\t' + str(i * j)
    print(i, stroked)
