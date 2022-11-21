import csv


with open("movies.csv") as csv_file:
    reader = csv.DictReader(csv_file)
