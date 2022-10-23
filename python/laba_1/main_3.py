x = float(input("x:"))
y = float(input("y:"))

x0 = 5
y0 = 5
line_1 = 2 * x + 10 
line_2 = 2 * x - 10 
circle_1 = (x - x0) ** 2 + (y - y0) ** 2
circle_2 = (x - x0) ** 2 - (y - y0) ** 2

R = 10

result = False

if x < 0 and y > line_2 :
    result = True


if y < 3 * x + 6 and (x - x0) ** 2 + (y - y0) ** 2 > R ** 2:
    result = True


if y == 3 * x + 6 and (x - x0) ** 2 + (y - y0) ** 2 == R ** 2:
    result = True


print(result)