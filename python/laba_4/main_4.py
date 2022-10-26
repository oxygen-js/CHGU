from random import randint, choice


class Game:
    def __init__(self, club_1, club_2):
        self.command1 = {"name": club_1, "goal": randint(0, 15)}
        self.command2 = {"name": club_2, "goal": randint(0, 15)}

    


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
    print(i.command1, i.command2)
