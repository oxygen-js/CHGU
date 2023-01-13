#pragma once
#include <string>
#include <iomanip>

typedef std::ostream& (*manip)(std::ostream&, char, int);


class MyManipulator
{
private:
	char c;
	std::string s;
	int length;
public:
	MyManipulator(char c, int l);
	friend std::ostream& operator<<(std::ostream& out, MyManipulator my);
};



