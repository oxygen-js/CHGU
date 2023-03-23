/*14. 
	Создать абстрактный класс человек, и производные от него девушка и юноша.
	Определить виртуальную функцию реакции человека на вновь увиденного другого человека.
	Для проверки определить массив указателей на абстрактный класс, которым присваиваются адреса различных объектов.
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