import csv

data = []

with open("movies.csv", newline='') as csv_file:
    reader = csv.DictReader(csv_file)
    keys = reader.fieldnames[:5]
    data.append(keys)
    for row in reader:
        item = []
        for key in keys:
            if key == "Жанр":
                item.append(list(row[key].split(',')))
            else:
                item.append(row[key])
        data.append(item)

print(data)
