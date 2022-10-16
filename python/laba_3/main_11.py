salaries = [100, 200, 100, 250, 100, 110, 220, 440, 100, 420, 110, 200]
max_salary = max(salaries)
index = salaries.index(max_salary)
quarter = 0

if (index <= 3):
    quarter = 1
if (index >= 4 and index <= 6):
    quarter = 2
if (index >= 7 and index <= 9):
    quarter = 3
if (index >= 10):
    quarter = 4

print("Максимальная запралата -", max_salary, "в", quarter, "квартале")