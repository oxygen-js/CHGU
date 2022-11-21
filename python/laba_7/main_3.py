import csv
from operator import attrgetter, itemgetter


def is_digit(string):
    if string.isdigit():
        return True
    else:
        try:
            float(string)
            return True
        except ValueError:
            return False


with open("movies.csv") as csv_file:
    reader = csv.DictReader(csv_file)
    moves = []
    for move in list(reader):
        for k, val in move.items():
            if is_digit(val):
                move[k] = float(val)
        moves.append(move)

# создать класс и на его основе сделать объекты по ключам -> использовать метод atrgetter из методички
    for i in sorted(moves, key=itemgetter(3, 6), reverse=True):
        print(i)
