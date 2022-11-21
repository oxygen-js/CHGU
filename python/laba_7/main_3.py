import csv
from operator import itemgetter


def is_digit(string):
    if string.isdigit():
        return True
    else:
        try:
            float(string)
            return True
        except ValueError:
            return False


def print_table(table):
    head = "{0:<35}|{1:^6}|{2:^9}|{3:^7}|{4:^8}|{5:^9} |".format(*list(map(lambda x: x.split(',')[0], table[0])))
    print(head, "\n", "-" * len(head))
    for i in table[1:]:
        values = [v for k, v in i.items()]
        print("{0:<35}|{1:^6.0f}|{2:>8.2f} |{3:>6} |{4:>7.1f} |{5:>9.1f} |".format(*values))


def sorted_table(data, revers=False, *key):
    result = sorted(data, key=itemgetter(*key), reverse=revers)
    return result


with open("movies.csv") as csv_file:
    reader = csv.DictReader(csv_file)
    moves = []
    for move in list(reader):
        cp_move = move.copy()
        for k, val in cp_move.items():
            if is_digit(val):
                move[k] = float(val)
            if k == "Жанр":
                del move[k]
        moves.append(move)

print("TABLE #1 - Сортировка по Бюджету и Сборам")
table_sort_bug_fees = sorted_table(moves, False, "Бюджет, \\$ млн", "Сборы, \\$ млн")
print_table(table_sort_bug_fees)

print("\n\nTABLE #2 - Сортировка по рейтингу в порядке убывания")
table_sort_rating = sorted_table(moves, True, "Рейтинг")
print_table(table_sort_rating)

