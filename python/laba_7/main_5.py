import csv
from operator import itemgetter
from dataclasses import dataclass


@dataclass(frozen=True)
class File:
    FILE_URL: str = "movies.csv"


def calc_count(data):
    genres = {}
    for i in data:
        for k in i:
            if k == "Жанр":
                keys = map(lambda x: x.replace(' ', ''), i[k].split(','))
                genres_key = list(genres.keys())
                for genre in keys:
                    if genre in genres_key and genres[genre] == 0:
                        genres[genre] += 1
                    else:
                        genres[genre] = None

                    if genres[genre] is None:
                        genres[genre] = 0

                    if genres[genre] > 0:
                        genres[genre] += 1

    print(genres)


with open(File.FILE_URL) as csv_file:
    reader = csv.DictReader(csv_file)

    calc_count(reader)
