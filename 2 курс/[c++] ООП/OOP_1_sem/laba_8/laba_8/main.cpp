/*14. 
	������� ����������� ����� �������, � ����������� �� ���� ������� � �����.
	���������� ����������� ������� ������� �������� �� ����� ���������� ������� ��������.
	��� �������� ���������� ������ ���������� �� ����������� �����, ������� ������������� ������ ��������� ��������.
*/

#include <iostream>
#include "string.h"
using namespace std;

class Human 
{
public:
	virtual void get_reaction(Human *obj) {};
};

class Man : public Human
{
public:

	void get_reaction(Human *obj) 
	{
		cout << "Viewed Girl - " << obj << endl;
	}
};

class Girl : public Human
{
public:
	void get_reaction(Human *obj)
	{
		cout << "Viewed Man - " << obj << endl;
	}
};

int main()
{
	Human* equation[2] = { new Man(), new Girl()};
	equation[0]->get_reaction(equation[1]);
	equation[1]->get_reaction(equation[0]);

	return 0;
}