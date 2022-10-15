nums = input("Numbers: ").split(' ')

dup = {x for x in nums if nums.count(x) > 1}
print(dup) 
