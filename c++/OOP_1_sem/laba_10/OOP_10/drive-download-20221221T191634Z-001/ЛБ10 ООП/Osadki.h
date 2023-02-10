#pragma once
#ifndef ANIMAL_H_
#define ANIMAL_H_
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include "AnimalManipulator.h"

using namespace std;

class Osadki
{
	string time;
	string type_osadki;
	int day;

public:
	Osadki();
	Osadki(string Type_osadki, double Day, string Time);
	Osadki(const Osadki& osadki);
	~Osadki();
	void Set(string Type_osadki, double Day, string Time);
	void SetTypeOsadki(string type_osadki);
	void SetDay(double day);
	void SetTime(string time);

	string GetTypeOsadki();
	double GetDay();
	string GetTime();

	void print_info();

	//		Перегрузка операторов ввода, вывода, записи, чтения
	friend istream& operator >> (istream& in, Osadki& obj);
	friend ostream& operator << (ostream& out, const Osadki& obj);
	friend ifstream& operator >> (ifstream& inf, Osadki& obj);
	friend ofstream& operator << (ofstream& outf, Osadki& obj);
};

#endif // ANIMAL_H_