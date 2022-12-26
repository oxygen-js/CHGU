#include "MyManipulator.h"

std::ostream& operator<<(std::ostream& out, MyManipulator my)
{
    return out << my;
}

MyManipulator::MyManipulator(char c, int l)
{
    this->c = c;
    this->length = l;
}
