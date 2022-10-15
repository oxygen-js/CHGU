numbers = input("Numbers: ").split(' ')
count = 0

result = ""


for i in numbers:
    num_left = numbers[count-1]

    if count == len(numbers) - 1:
        num_right = numbers[0]
    else:
        num_right = numbers[count+1]

    result += str(int(num_left) + int(num_right)) + " "
    count += 1


print(result)
