// ConsoleApplication1.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <iostream>

using namespace std;

class Engine
{
public:
	double power = 1.6;
	Engine(double in_power)
	{
		power = in_power;
	}
};

class Turbine
{
public:
	double radius = 10.76;
	Turbine(double in_radius)
	{
		radius = in_radius;
	}
};

class Diesel
{
public:
	double temp = 80.0;
	Diesel(double in_temp)
	{
		temp = in_temp;
	}
};

class Electric_motor : public Engine, public Diesel, public Turbine
{
	double distance = 0;
public:
	Electric_motor(double in_distance, double in_power, double in_radius, double in_temp) : Engine(in_power), Turbine(in_radius), Diesel(in_temp)
	{
		distance = in_distance;
	}

	void info()
	{
		cout << "Дистанция = " << distance << endl;
		cout << "Мощность двигателя = " << power << endl;
		cout << "Радиус турбины = " << radius << endl;
		cout << "Температура = " << temp << endl;
	}
};



int main()
{

	setlocale(0, "RUS");
	Electric_motor motor(2000.10, 2.0, 10.1, 75.0);
	motor.info();

	system("pause");

    return 0;
}

