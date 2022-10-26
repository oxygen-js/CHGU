from random import randint, choice


class Game:
    def __init__(self, club_1, club_2):
        self.command1 = {"name": club_1, "goal": randint(0, 15)}
        self.command2 = {"name": club_2, "goal": randint(0, 15)}


class Table:
    dict
    # ВОЗМОЖНО ВСТАВИТЬ НАЗВАНИЯ КОМАНД?
    # def __init__(self, club, all_game, win, draw, loss):
        # self.club["name"] = { "name": club["name"], "all_game": all_game, "win": win, "draw": draw, "loss": loss }


all_game = int(input("All game: "))
if all_game > 10:
    all_game = 10

clubs = ["Спартак", "Локоматив", "ЦСК", "Терек", "Сатурн", "РФК «Ахмат» Грозный",
         "Динамо", "Торпедо", "Ростов", "Ратор", "Крылья советов"]
games = []

cout = 0
for i in range(all_game):
    club_1 = choice(clubs)
    club_2 = choice(clubs)

    while club_1 == club_2:
        club_2 = choice(clubs)

    game = Game(club_1, club_2)
    games.append(game)


for i in games:
    print(f"{i.command1['name']} - {i.command1['goal']}; {i.command2['name']} - {i.command2['goal']}")


#Команда:Всего_игр Побед Ничьих Поражений Всего_очков
table = Table() 
for i in games:
    name_club_1 = i.command1["name"]
    name_club_2 = i.command2["name"]
    table[name_club_1] = name_club_1
    table[name_club_2] = name_club_2
    if i.command1["goal"] > i.command2["goal"]:
        table[name_club_1]["win"] = table[name_club_1]["win"] + 1
    else:
        table[name_club_2]["win"] = table[name_club_2]["win"] + 1

    

print(table)
