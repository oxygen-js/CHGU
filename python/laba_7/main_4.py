import csv
from dataclasses import dataclass


@dataclass(frozen=True)
class File:
    FILE_URL: str = "movies.csv"


def is_digit(string):
    if string.isdigit():
        return True
    else:
        try:
            float(string)
            return True
        except ValueError:
            return False


def generate_table(data):
    arr = []
    for move in data:
        for k, val in move.copy().items():
            if is_digit(val):
                move[k] = float(val)
            if k == "Жанр":
                del move[k]
        arr.append(move)
    return arr


def print_table(data):
    head = "{0:<35}|{1:^6}|{2:^9}|{3:^7}|{4:^8}|{5:^9} |{6:^9} |".format(*list(map(lambda x: x.split(',')[0], data[0])))
    print(head, "\n", "-" * len(head))
    for i in data[1:]:
        values = [v for k, v in i.items()]
        print("{0:<35}|{1:^6.0f}|{2:>8.2f} |{3:>6} |{4:>7.1f} |{5:>9.1f} |{6:>9.1f} |".format(*values))


def calc_profit(data):
    """#1 - Добавление в вашу “таблицу” столбца “Прибыль”, которая равна разнице между сборами и бюджетом за каждый
    фильм. """
    for row in list(data):
        row["Прибыль"] = (row["Сборы, \\$ млн"] - row["Бюджет, \\$ млн"])
        data.append(row)
    print("TEST", data)
    return data


def sum_column(data):
    """#2 - Расчет суммы значений в столбце"""
    for row in list(data):
        row["Прибыль"] = (row["Сборы, \\$ млн"] - row["Бюджет, \\$ млн"])
        data.append(row)
    return data


with open(File.FILE_URL) as csv_file:
    reader = csv.DictReader(csv_file)
    moves = generate_table(list(reader))

    table_profit = calc_profit(moves)
    print_table(table_profit)
