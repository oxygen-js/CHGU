# Взять строку, посчитать количество всех повторяющихся символов, вывести в виде словаря 
# {символ : количество повторений}

text = input("text: ")
stage = []

for i in text:
    lower_i = i.lower()
    if lower_i not in stage:
        stage.append(lower_i)
        obj = { i: text.count(lower_i) }
        print(obj)