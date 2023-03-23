import csv
from operator import itemgetter
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


def sorted_table(data, revers=False, *key):
    result = sorted(data, key=itemgetter(*key), reverse=revers)
    return result


def print_table(data):
    names_column = list(map(lambda x: x.split(',')[0], data[0]))
    head = "{0:<35}|{1:^6}|{2:^9}|{3:^7}|{4:^8}|{5:^9} |{6:^9} |".format(*names_column)
    print(head, "\n", "-" * len(head))
    for row in data[1:]:
        values = [row[k] for k in row]
        print("{0:<35}|{1:^6.0f}|{2:>8.2f} |{3:>6} |{4:>7.1f} |{5:>9.1f} |{6:>9.1f} ".format(*values))


def print_table_price_one_minute(data):
    names_column = list(map(lambda x: x.split(',')[0], data[0]))
    head = "{0:<35}|{1:^6}|{2:^9}|{3:^7}|{4:^8}|{5:^9} |{6:^9} |{7:^9}$ |".format(*names_column)
    print(head, "\n", "-" * len(head))
    for row in data[1:]:
        values = [row[k] for k in row]
        print("{0:<35}|{1:^6.0f}|{2:>8.2f} |{3:>6} |{4:>7.1f} |{5:>9.1f} |{6:>9.1f} |{7:>14.1f} |".format(*values))


def print_table_ticket(data):
    names_column = list(map(lambda x: x.split(',')[0], data[0]))
    head = "{0:<40}|{1:^6}|".format(*names_column)
    print_title(head)
    for row in data[1:]:
        values = [row[k] for k in row]
        print("{0:<40}|{1:^13.2f}|".format(*values))


def print_title(string):
    title = string
    delimiter = '-' * len(string)
    print(f"{title}\n{delimiter}")


def calc_profit(data):
    for row in list(data):
        row["Прибыль"] = (row["Сборы, \\$ млн"] - row["Бюджет, \\$ млн"])
        data.append(row)
    return data


def calc_price_one_min(data):
    for row in list(data):
        row["Стоим. 1 мин."] = (row["Сборы, \\$ млн"] / row["Длина, мин."])
        data.append(row)
    return data


def calc_sum_profit(data):
    arr = list(map(lambda x: x["Прибыль"], list(data)))
    return sum(arr)


def average_column(data):
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


def average_print(data):
    for i in data:
        if i != "Название":
            if i == "Год":
                print("{0:<18}{1:>7.0f}".format(str(i + ": "), data[i]))
            else:
                print("{0:<18}{1:>7.2f}".format(str(i + ": "), data[i]))


def calc_ticket(data):
    result = [{"Название": i["Название"], "Цена билета $": i["Сборы, \\$ млн"] / i["Бюджет, \\$ млн"]} for i in data]
    return result


with open(File.FILE_URL) as csv_file:
    reader = csv.DictReader(csv_file)
    moves = generate_table(list(reader))

    table_profit = sorted_table(calc_profit(moves), False, "Прибыль")
    print_table(table_profit)

    sum_profit = calc_sum_profit(table_profit)
    print("\n\n#4.1.2\nСУММА ПРИБЫЛИ: {0: 6.2f}".format(sum_profit))

    average = average_column(table_profit)
    print_title("\n\n#4.2 - СРЕДНИЕ ЗНАЧЕНИЯ")
    average_print(average)

    print_title("\n\n#4.3 - Цена за каждый билет")
    table_price_ticket = calc_ticket(moves)
    print_table_ticket(table_price_ticket)

    print_title("\n\n#4.4 - Стоимость 1 минуты")
    table_price_min = sorted_table(calc_price_one_min(moves), True, "Стоим. 1 мин.")
    print_table_price_one_minute(table_price_min)
