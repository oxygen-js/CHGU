import collections
from random import randint


class Candidate:
    def __init__(self, name):
        self.name = name

    def get_rating(self):
        return {
            1: randint(0, 15),
            2: randint(0, 15),
            3: randint(0, 15),
            4: randint(0, 15),
            5: randint(0, 15),
            6: randint(0, 15),
            7: randint(0, 15),
            8: randint(0, 15),
            9: randint(0, 15)
        }

    def max_rating(self):
        ratings = []
        for k, v in self.get_rating().items():
            ratings.append(v)
        return max(ratings)


dict_candidate = dict({
    "Boris": Candidate("Boris").max_rating(),
    "Tom": Candidate("Tom").max_rating(),
    "Andey": Candidate("Andey").max_rating(),
    "Kolya": Candidate("Kolya").max_rating(),
    "Vladimir": Candidate("Vladimir").max_rating(),
    "Vasya": Candidate("Vasya").max_rating(),
    "Jerry": Candidate("Jerry").max_rating(),
    "Peter": Candidate("Peter").max_rating(),
    "Tim": Candidate("Tim").max_rating(),
})


candidates = {k: v for k, v in sorted(dict_candidate.items(), key=lambda item: item[1])}
[candidate_1, candidate_2, candidate_3] = collections.deque(candidates, maxlen=3)

print("Candidate #1: ", candidate_1)
print("Candidate #2: ", candidate_2)
print("Candidate #3: ", candidate_3)
