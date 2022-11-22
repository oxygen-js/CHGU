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
    """ #1 - Добавление в вашу “таблицу” столбца “Прибыль”, которая равна разнице между сборами и бюджетом за каждый
    фильм. """
    for row in list(data):
        row["Прибыль"] = (row["Сборы, \\$ млн"] - row["Бюджет, \\$ млн"])
        data.append(row)
    print("TEST", data)
    return data


def calc_sum_profit(data):
    """ #2 - Расчет суммы значений в столбце """
    arr = list(map(lambda x: x["Прибыль"], list(data)))
    return sum(arr)


def average_column(data):
    """ #3 - Расчет среднего значения каждого столбца """
    keys = data[0].keys()
    average_list = dict.fromkeys(keys, 0.0)
    for i in list(data):
        for k, v in i.items():
            if k != "Название":
                average_list[k] += v

    for k, v in average_list.items():
        if k != "Название":
            average_list[k] = average_list[k] / len(data)

    return average_list


with open(File.FILE_URL) as csv_file:
    reader = csv.DictReader(csv_file)
    moves = generate_table(list(reader))

    table_profit = calc_profit(moves)
    print_table(table_profit)

    sum_profit = calc_sum_profit(table_profit)
    print("\n\nСУММА ПРИБЫЛИ: {0: 6.2f}".format(sum_profit))

    average = average_column(table_profit)
    print(f"\n\nСРЕДНЕЕ ЗНАЧЕНИЕ\n{'-' * len(average)}")
    for i in average:
        if i != "Название":
            if i == "Год":
                print("{0:<18}{1:>7.0f}".format(str(i + ": "), average[i]))
            else:
                print("{0:<18}{1:>7.2f}".format(str(i + ": "), average[i]))
