class Buffer:
    def __init__(self):
        pass

    __elements = []
    __sum = 0

    def add(self, *a):
        for el in [*a]:
            self.__elements.append(el)
            if len(self.__elements) == 5:
                print("add method: ", sum(self.__elements))
                self.__elements = self.__elements[5:len([*a])]

    def get_current_part(self):
        print("get_current_part method: ", self.__elements)
        return self.__elements


buf = Buffer()
buf.add(1, 2, 3)
buf.get_current_part()  # вернуть [1,2,3]
buf.add(4, 5, 6)  # print(15) - вывод суммы первой пятерки элементов
buf.get_current_part()  # вернуть [6]
buf.add(7, 8, 9, 10)  # print(40) - вывод суммы второй пятерки элементов
buf.get_current_part()  # вернуть []
buf.add(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)  # print(5) print(5) - вывод суммы третей и четвертой пятерки
