a = int(input('a: '))
b = int(input('b: '))
c = int(input('c: '))
d = int(input('d: '))


for i in range(a, b):
    print('\t', i)

for i in range(c, d):
    for j in range(a, b):
        print(i, '\t', i * j)