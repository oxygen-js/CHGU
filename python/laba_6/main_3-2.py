class Warrior:
    def __init__(self, name):
        self.hp = 100
        self.name = name

    def check_win(self, enemy):
        if self.hp == 0:
            print(f"Победил - {enemy.name}")
            exit(0)

        if enemy.hp == 0:
            print(f"Победил - {self.name}")
            exit(0)

    def damage(self, enemy):
        enemy.hp = enemy.hp - 20
        print(f"Ударил {self.name}; HP врага - {enemy.hp}")
        self.check_win(enemy)


unit_1 = Warrior("Spoky")
unit_2 = Warrior("Lolipop")

unit_1.damage(unit_2)
unit_2.damage(unit_1)
unit_2.damage(unit_1)
unit_1.damage(unit_2)
unit_2.damage(unit_1)
unit_1.damage(unit_2)
unit_2.damage(unit_1)
unit_2.damage(unit_1)
unit_1.damage(unit_2)
unit_2.damage(unit_1)
unit_1.damage(unit_2)
unit_2.damage(unit_1)
unit_2.damage(unit_1)
unit_1.damage(unit_2)
unit_2.damage(unit_1)
