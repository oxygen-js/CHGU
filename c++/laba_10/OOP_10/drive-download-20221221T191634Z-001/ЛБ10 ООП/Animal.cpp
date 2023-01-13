#include "Osadki.h"



Osadki::Osadki(){}
Osadki::Osadki(string Type_osadki, double Day, string Time)
{
	this->day = Day;
	this->time = Time;
	this->type_osadki = Type_osadki;
}
Osadki::Osadki(const Osadki& obj)
{
	this->day = obj.day;
	this->time = obj.time;
	this->type_osadki = obj.type_osadki;
}
Osadki::~Osadki(){}

void Osadki::Set(string Type_osadki, double Day, string Time)
{
	this->day = Day;
	this->time = Time;
	this->type_osadki = Type_osadki;
}
void Osadki::SetTypeOsadki(string Type_osadki)
{
	this->type_osadki = Type_osadki;
}
void Osadki::SetTime(string Time)
{
	this->time = Time;
}
void Osadki::SetDay(double Day)
{
	this->day = Day;
}
string Osadki::GetTypeOsadki()
{
	return type_osadki;
}
string Osadki::GetTime()
{
	return time;
}
double Osadki::GetDay()
{
	return day;
}
void Osadki::print_info()
{
	cout << "Тип осадков - " << type_osadki;
	cout << "\nВремя - " << time;
	cout << "\nДень - " << day << "\n\n";
}



istream& operator >> (istream& in, Osadki& obj)
{
	cout << "type   : "; in >> obj.type_osadki;
	cout << "time : "; in >> obj.time;
	cout << "day : "; in >> obj.day;
	return in;
}

ostream& operator << (ostream& out, const Osadki& obj)
{
	out << "Type = " << obj.type_osadki
		<< "\ntime = " << obj.time
		<< "\nday = " << obj.day << '\n';
	return out;
}

ifstream& operator >> (ifstream& inf, Osadki& obj)
{
	inf >> obj.type_osadki;
	inf >> obj.time;
	inf >> obj.day;
	return inf;
}

ofstream& operator<<(ofstream& outf, Osadki& obj)
{
	outf << obj.type_osadki << endl
		<< obj.time << endl
		<< obj.day;
	return outf;
}
