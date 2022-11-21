import csv


def is_digit(string):
    if string.isdigit():
        return True
    else:
        try:
            float(string)
            return True
        except ValueError:
            return False


data = []
with open("movies.csv") as csv_file:
    reader = csv.DictReader(csv_file)
    name_column = reader.fieldnames[:4] + reader.fieldnames[-2:]
    data.append(list(name_column))
    for row in reader:
        item = []
        for column in name_column:
            if is_digit(row[column]):
                item.append(float(row[column]))
            else:
                item.append(row[column])
        data.append(item)

columns = list(map(lambda x: x.split(',')[0], data[0]))
print("{0:<35}|{1:^6}|{2:^9}|{3:^7}|{4:^8}|{5:^9} |".format(*columns))
print("-" * len(columns))
for item in data[1:]:
    print("{0:<35}|{1:^6.0f}|{2:>8.2f} |{3:>6} |{4:>7.1f} |{5:>9.1f} |".format(*item))
