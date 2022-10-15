import itertools

in_str = str.lower(input("You string: "))
list_group_ch = [''.join(value) for key, value in itertools.groupby(in_str)]
result = ""

for i in list_group_ch:
    result += i[:1] + str(len(i))

print(result)