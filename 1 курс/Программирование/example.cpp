#include <list>
#include <iostream>
#include <string>
#include<fstream>
using namespace std;
struct Sklad {
	int number;
	string typeTovar;
	string adress;
	int countPlase;
	int adminID;
};

void Add(list<Sklad> skladList, list<Sklad>::iterator ptr);
void Remove(list<Sklad> skladList, list<Sklad>::iterator ptr);
void Find(list<Sklad> skladList, list<Sklad>::iterator ptr);
void Save(list<Sklad> skladList, list<Sklad>::iterator ptr);
void Print(list<Sklad> skladList, list<Sklad>::iterator ptr);
void Sort(list<Sklad> skladList, list<Sklad>::iterator ptr);
void Exit(list<Sklad> skladList, list<Sklad>::iterator ptr);
void menu(list<Sklad> skladList, list<Sklad>::iterator ptr);


void Add(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	Sklad newSklad;
	cout << "������ ����� ������" << endl;
	cin >> newSklad.number;
	cout << "������� ��� ������" << endl;
	cin >> newSklad.typeTovar;
	cout << "������ �����" << endl;
	cin >> newSklad.adress;
	cout << "������ ���������� ����" << endl;
	cin >> newSklad.countPlase;
	cout << "������ ����� ����������" << endl;
	cin >> newSklad.adminID;
	skladList.push_back(newSklad);
	menu(skladList, ptr);
}

void Remove(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	int n;
	cout << "������� ����� ������ ��� ��������";
	cin >> n;
	ptr = skladList.begin();
	for (int i = 0; i < skladList.size() - 1; i++) {
		if (ptr->number == n) {
			ptr = skladList.erase(ptr);
			ptr--;
		}
		ptr++;
	}
	if (ptr->number == n) {
		skladList.pop_back();
	}
	menu(skladList, ptr);

}

void Find(list<Sklad> skladList, list<Sklad>::iterator ptr) {/*������ ��������������*/}

void Save(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	ofstream fileSclad("sklad1.txt");//����� ������� ��������� ������ �� sklad.txt
	if (!fileSclad) cout << "����� ������� ����������" << endl;
	string str;
	for (ptr = skladList.begin(); ptr != skladList.end(); ptr++) {
		str = to_string(ptr->number) + ";" + ptr->typeTovar + ";" + ptr->adress + ";" + to_string(ptr->countPlase) + ";" + to_string(ptr->adminID);
		fileSclad << str << endl;
	}
	menu(skladList, ptr);
}

void Sort(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	int n;
	cout << "�������� ����������� ����������" << endl;
	cout << "�� ����������� -- 1" << endl;
	cout << "�� �������� --2 " << endl;
	cin >> n;
	if (n == 2) {
		skladList.sort([](const Sklad& a, const Sklad& b) {return a.countPlase > b.countPlase; });
	}
	else
	{
		skladList.sort([](const Sklad& a, const Sklad& b) {return a.countPlase < b.countPlase; });
	}
	menu(skladList, ptr);
}

void Print(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	for (ptr = skladList.begin(); ptr != skladList.end(); ptr++) {
		cout << ptr->number << " " << ptr->typeTovar << " " << ptr->adress << " " << ptr->countPlase << " " << ptr->adminID << endl;
}
	menu(skladList, ptr);
}

void Exit(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	string ans;
	cout << "��������� ������? y/n" << endl;
	cin >> ans;
	if (ans == "y")
	{
		cout << "��������� ��������� ����� ������� y/n" << endl;
		cin >> ans;
		if (ans == "y")
		{
			//�������� ������� Save           
			ofstream fileSclad("sklad1.txt");
			if (!fileSclad) cout << " ���� ������� ����������!" << endl;
			string str;
			for (ptr = skladList.begin(); ptr != skladList.end(); ptr++) {
				str += to_string(ptr->number) + ";" + ptr->typeTovar + ";" + ptr->adress + ";" + to_string(ptr->countPlase) + ";" + to_string(ptr->adminID);
				fileSclad << str << endl;
				str = "";
			}
			exit(2);
		}
		else exit(2);
	}
	else menu(skladList, ptr);

}

void menu(list<Sklad> skladList, list<Sklad>::iterator ptr) {
	cout << "�������� �������" << endl;
	cout << "�������� ������ -- 1 " << endl;
	cout << "������� ������ -- 2 " << endl;
	cout << "����� �� ������ ������-- 3 " << endl;
	cout << "���������� �� ������������ ���� -- 4 " << endl;
	cout << "���������� ��������� -- 5 " << endl;
	cout << "����� ������ �� ����� -- 6 " << endl;
	cout << "��������� ������ -- 7 " << endl;
	int punct;
	cin >> punct;
	switch (punct)
	{
	case 1:
		Add(skladList, ptr);
		break;
	case 2:
		Remove(skladList, ptr);
		break;
	case 3:
		Find(skladList, ptr);
		break;
	case 4:
		Sort(skladList, ptr);
		break;
	case 5:
		Save(skladList, ptr);
		break;
	case 6:
		Print(skladList, ptr);
		break;
	case 7:
		Exit(skladList, ptr);
		break;
	default:
		cout << "������� ����� �� 1-5" << endl;
		menu(skladList, ptr);
		break;
	}
}

int main(){
	setlocale(LC_ALL, "Rus");
	list<Sklad>skladList;
	list<Sklad>::iterator ptr;
	ifstream fileSclad("sklad.txt");
	string skladCortej;
	int endVal[4], n=0;
	while (getline(fileSclad, skladCortej))
	{
		for (int i = 0; i < 4; i++) {
			n = skladCortej.find(";", n);
			endVal[i] = n;
			n++;
		}
		n = 0;
		Sklad infoSklad;
		infoSklad.number = stoi(skladCortej.substr(0, endVal[0]));
		infoSklad.typeTovar = skladCortej.substr(endVal[0] + 1, endVal[1] - endVal[0] - 1);
		infoSklad.adress = skladCortej.substr(endVal[1] + 1, endVal[2] - endVal[1] - 1);
		infoSklad.countPlase = stoi(skladCortej.substr(endVal[2] + 1, endVal[3] - endVal[2] - 1));
		infoSklad.adminID = stoi(skladCortej.substr(endVal[3] + 1, skladCortej.length()));
		skladList.push_back(infoSklad);
		//cout << infoSklad.number << ";" << infoSklad.adress;
	}
	menu(skladList, ptr);
}

/*����������� ������������� ���������� ������� ��� ������ � ����� ������.
������� ������ : ���� ������ ������� �� �������. 
(����� ������, ��� ������������ �������, �����, ���������� ����, ��� �������������� ���������� )
���������� : -�������� ������ � ����������� ������ � ��������������� ������ : 
�) �� ���������� �����;
�) � ����������;
-�������� ����������� ���� ������;
-�������������� ���� ������ : 
�) �������� ������; 
�) ���������� ������;
-��������� ������ : 
�) � ��������� ����;
�) �� �����;
-����� ������ �� ������ ������; 
-���������� ������ �� ���������� ����;
*/