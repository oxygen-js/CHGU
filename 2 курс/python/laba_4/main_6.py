print("# Spelling".upper())


def enter_words():
    in_str = input("Word: ")
    words = in_str.split(' ')

    for i in words:
        print("You word - ", i)

    print("-------------\n\n")
    return words


right_words = enter_words()
user_words = enter_words()

for word in user_words:
    if word not in right_words:
        print(f"ERROR. {word} not found")
