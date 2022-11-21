import csv

data = []

with open("movies.csv", newline='') as csv_file:
    reader = csv.DictReader(csv_file)
    name_columns = reader.fieldnames[:5]
    data.append(name_columns)
    for row in reader:
        item = []
        for column in name_columns:
            if column == "Жанр":
                item.append(list(row[column].split(',')))
            else:
                item.append(row[column])
        data.append(item)

print(data)
