from random import randint, choice


class Game:
    def __init__(self, club_1, club_2):
        self.command1 = {"name": club_1, "goal": randint(0, 15)}
        self.command2 = {"name": club_2, "goal": randint(0, 15)}


all_games = int(input("All game: "))
if all_games >= 10:
    all_games = 9
clubs_name = ["Спартак", "Локоматив", "ЦСК", "Терек", "Сатурн", "Ахмат", "Динамо", "Торпедо", "Ростов",
              "Ратор", "Крылья"]
games = []

for i in range(all_games):
    club_1 = choice(clubs_name)
    club_2 = choice(clubs_name)

    while club_1 == club_2:
        club_2 = choice(clubs_name)

    game = Game(club_1, club_2)
    games.append(game)

for i in games:
    print(f"{i.command1['name']} - {i.command1['goal']}; {i.command2['name']} - {i.command2['goal']}")

print("\n\n")
table = [
    {"name": "ЦСК", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Терек", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Сатурн", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Ахмат", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Динамо", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Торпедо", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Ростов", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Ратор", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Крылья", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Спартак", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
    {"name": "Локоматив", "win": 0, "goal": 0, "loss": 0, "draw": 0, "all_games": 0, "points": 0},
]

for i in games:
    club_1 = {}
    club_2 = {}

    for club in table:
        if club["name"] == i.command1["name"]:
            club_1 = club
        if club["name"] == i.command2["name"]:
            club_2 = club

    if i.command1["goal"] > i.command2["goal"]:
        club_1["win"] += 1
        club_1["points"] += 3
        club_2["loss"] += 1
    else:
        club_2["win"] += 1
        club_1["loss"] += 1

    if i.command1["goal"] == i.command2["goal"]:
        club_1["points"] += 1
    else:
        club_2["points"] += 1

    club_1["all_games"] += 1
    club_2["all_games"] += 1

for i in table:
    if i["all_games"] > 0:
        print(f"{i['name']}: {i['all_games']}; {i['win']}; {i['draw']}; {i['loss']}; {i['points']};")
