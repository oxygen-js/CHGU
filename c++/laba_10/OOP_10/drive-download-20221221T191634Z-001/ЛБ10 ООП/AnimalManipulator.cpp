#include "AnimalManipulator.h"
#include <string>
#include <iomanip>


using std::cout;
using std::endl;

AnimalManipulator::AnimalManipulator(){}

AnimalManipulator::AnimalManipulator(std::ostream& (*ff)(std::ostream&, int), int ii) : f(ff), i(ii) {};

std::ostream& SetLine(std::ostream& out, char c, unsigned int amount)
{
	std::string s(amount, c);
	out << s;
	return out;
}
