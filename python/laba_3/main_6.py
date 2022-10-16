def get_indices(lst, elem):
    return [i for i, x in enumerate(lst) if x == elem]


print("Sample Input:")

stroked = input().split(' ')
find_value = input()

arr = get_indices(list(stroked), find_value)
result = ""

for i in arr:
    result += str(i) + " "

print("Sample Output:")

if len(result):
    print(result)
else:
    print("Отсутствует")
