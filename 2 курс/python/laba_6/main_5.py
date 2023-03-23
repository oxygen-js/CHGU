class ExtendedStack(list):
    def __validate(self):
        if len(self) < 2:
            raise ValueError("Должно быть больше двух элементов в стеке")

    def sum(self):
        self.__validate()
        result = self.pop() + self.pop()
        self.append(result)
        return result

    def sub(self):
        self.__validate()
        result = self.pop() - self.pop()
        self.append(result)
        return result

    def mul(self):
        self.__validate()
        result = self.pop() * self.pop()
        self.append(result)
        return result

    def div(self):
        self.__validate()
        result = self.pop() / self.pop()
        self.append(result)
        return result


stack = ExtendedStack()
stack.append(1)
stack.append(10)
stack.append(2)
stack.append(3)
stack.append(5)
stack.append(7)
stack.append(12)

print(stack.sum())
print(stack.sub())
print(stack.mul())
print(stack.div())
