def generate(fio, group, ocenka):
    return [fio, group, sum(ocenka) / len(ocenka)]


fio = [ "Kazakov Ivan Gennadievich", "Petrov Sasha Michalovich", "Suslikova Sveta Andreevna", "Ivanov Ivan Andreevich", "Sidorov Andrey Gennadievich", "Tigrova Anna Radionovna", "Lampova Irina Olegovna", "Popov Andrey Gennadievich", "Tabulanov Oleg Petrovich", "Mokeev Andrey Aleksandrovich" ]

groups = ["КТ-41-29", "КТ-52-19", "КТ-65-17", "КТ-42-34", "КТ-85-29", "КТ-44-73", "КТ-10-007", "КТ-13-13", "КТ-12-11", "КТ-25-99"]

ocenka = [
    [5.4, 4.4, 5.5, 3.0, 4.2],
    [5.2, 3.4, 5.4, 3.3, 5.2],
    [3.2, 3.3, 3.4, 3.2, 3.2],
    [5.3, 4.4, 5.4, 4.5, 5.2],
    [3.3, 3.4, 4.4, 5.1, 5.2],
    [4.3, 3.4, 5.2, 5.2, 3.1],
    [4.3, 4.4, 4.2, 5.2, 5.1],
    [3.3, 3.4, 3.3, 5.0, 3.1],
    [4.0, 3.0, 3.3, 5.5, 4.1],
    [4.5, 3.5, 3.5, 5.5, 5.5],
]

students = list(map(generate, fio, groups, ocenka))

print(students)
