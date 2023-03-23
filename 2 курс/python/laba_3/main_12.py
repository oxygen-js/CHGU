arr = [100, 200, 100, 250, 100, 110, 220, 440, 100, 420, 110, 200]
print(arr, '\n--------------------')

max_num = max(arr)
index_max_num = arr.index(max_num)

min_num = min(arr)
index_min_num = arr.index(min_num)

arr[index_max_num] = min_num
arr[index_min_num] = max_num

print("Max", max_num)
print("Min", min_num)
print(arr)
