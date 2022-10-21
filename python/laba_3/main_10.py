text = input("Text: ")
arr = text.split(' ')
copy_arr = text.lower().split(' ')

stage = []

for i in arr:
    lower_item = i.lower()
    if lower_item not in stage:
        stage.append(lower_item)
        print(i, copy_arr.count(lower_item))
