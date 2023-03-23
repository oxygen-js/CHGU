in_str = str.upper(input("You string: "))
count = in_str.count("G") + in_str.count("C")

print("Result =", (count / len(in_str)) * 100)