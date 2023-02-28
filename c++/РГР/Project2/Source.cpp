#include <iostream>
#include <fstream>
#include <cstdlib>
#include <Windows.h>
#include <algorithm>
#include <string>
#include <list>

using namespace std;

struct Boln
{
	int lech;// ����� �������� �����
	int kod;// ��� ��������
	int age;// ������� ��������
	string diag;// �������
};

const string PName = "bb.txt";
const string lName = "ll.txt";

int Command;
bool needToDisplay = true;
int patientkol;
int patientkod;
int llech;

//��������
bool file1()
{
	ifstream read; // ������� ������ ������ ifstream
	read.open(PName);
	if (!read.is_open()) // ��������� ������ �� ����
	{
		cout << "������ �������� �����!" << endl;
		exit(0);
	}
	read.seekg(0, ios::end);
	return read.tellg() != 0;
}
//�����
bool file2()
{
	ifstream readl; // ������� ������ ������ ifstream
	readl.open(lName);
	if (!readl.is_open()) // ��������� ������ �� ����
	{
		cout << "������ �������� �����!" << endl;
		exit(0);
	}
	readl.seekg(0, ios::end);
	return readl.tellg() != 0;
}
// (������ ��������)
void DisplayOptions() // (����� �������)
{
	if (!needToDisplay)
	{
		return;
	} // �������
	cout << "������� ��������: " << endl;
	cout << " �������������� ���� ������: " << endl;
	cout << "	- ���������� ������ - 1" << endl;
	cout << "	- �������� ������ - 2" << endl;
	cout << " ����� ������ - 3" << endl;
	cout << " ����� ������� �� ���� �������� - 4" << endl;
	cout << " ���������� ������ �� �������� - 5" << endl;
	cout << " ��������� ���������� ���������� � ������� ����� - 6" << endl;
	cout << " ����� - 0" << endl;
	cin >> Command;
}
// ���������� ������
void SaveData(Boln* (&patients))
{
	ofstream record(PName, ios::out);

	if (record)
	{
		if (patientkol != 0)
		{
			record << patientkol << endl;
		}

		for (int i = 0; i < patientkol; i++)
		{
			record << patients[i].kod << endl;

			record << patients[i].lech << endl;

			record << patients[i].diag << endl;

			record << patients[i].age << endl;
		}
	}
	else
	{
		cout << "����� �� ����������" << endl; 
		exit(0);
	}

	record.close();
}

void CopyData(Boln* (&st_new), Boln* (&st_old), int n)
{
	for (int i = 0; i < n; i++)
	{
		st_new[i] = st_old[i];
	}
}

void CopyData(Boln& st_new, Boln& st_old)
{
	st_new.kod = st_old.kod;
	st_new.lech = st_old.lech;
	st_new.diag = st_old.diag;
	st_new.age = st_old.age;
}
// ���������� ����� ������
void Addpatient(Boln* (&patients))
{
	Boln* buf = new Boln[patientkol]; // �������� ����� ���������� ��� ���������
	CopyData(buf, patients, patientkol);// ���������� ������ (�����)
	patientkol++;
	patients = new Boln[patientkol];
	CopyData(patients, buf, patientkol - 1);
	int a = patientkol - 1;
	//��������� ������ ������ ��� ���������� ����� ������

	cout << "������� ��� ��������" << endl;
	cin >> patients[a].kod;
	cout << "������� ������� ��������" << endl;
	cin >> patients[a].age;
	cout << "������� ������� ��������" << endl;
	cin >> patients[a].diag;
	cout << "������� ����� �������� �����" << endl;
	cin >> patients[a].lech;

	delete[]buf; // �������� ����� ����������
}
// ����� ������
void patients3(Boln* (&patients))
{
	if (!file1()) // ��������� ���� �� ������
	{
		cout << "������� ���!" << endl; // ���� �� ��� ������� �������������� ���������
		return;
	}
	// ������� ��� ��������� ������ �� �����
	for (int i = 0; i < patientkol; i++)
	{
		cout << "___________________________________" << endl;
		cout << "��� �������� " << patients[i].kod << endl; // ��� ��������
		cout << "���� " << patients[i].lech << endl; // ������� ����
		cout << "������� " << patients[i].diag << endl; // ������� ��������
		cout << "������� " << patients[i].age << endl; // ������� ��������
		cout << "___________________________________" << endl;
	}
}

void patients4(Boln* (&patients), int patientkod) // ������ �� �������
{
	if (!file1())
	{
		cout << "������� ���!" << endl;
		return;
	}

	for (int i = 0; i < patientkol; i++)
	{
		if (patients[i].kod == patientkod)
		{
			cout << "___________________________________" << endl;
			cout << "��� �������� " << patients[i].kod << endl;
			cout << "���� " << patients[i].lech << endl;
			cout << "������� " << patients[i].diag << endl;
			cout << "������� " << patients[i].age << endl;
			cout << "___________________________________" << endl;
		}
	}
}

// ����������
bool compareSort(Boln*& a, Boln*& b)
{
	return a->age < b->age; // ��������� �� ��������
}

void patients5(Boln* (&patients), bool useSort)
{
	if (!file1())
	{
		cout << "������� ���" << endl;
		return;
	}

	if (!useSort)
	{
		return;
	}

	Boln* buf = new Boln[patientkol];

	CopyData(buf, patients, patientkol);

	list<Boln*> st;

	for (int i = 0;
		i < patientkol; i++)
	{
		st.push_back(&buf[i]);
	}
	st.sort(compareSort);

	for (auto s : st)
	{
		cout << "___________________________________" << endl;
		cout << "��� �������� " << s->kod << endl;
		cout << "���� " << s->lech << endl;
		cout << "������� " << s->diag<< endl;
		cout << "������� " << s->age << endl;
		cout << "___________________________________" << endl;
	}
}
// �������� ������
void DeleteBoln(Boln* (&patients))
{
	cout << "������� id ��������" << endl;
	int id;
	cin >> id;
	id--;
	if (id >= 0 && id < patientkol)
	{
		Boln* buf = new Boln[patientkol];
		CopyData(buf, patients, patientkol);
		patientkol--;
		patients = new Boln[patientkol];

		int q = 0;

		for (int i = 0; i <= patientkol; i++)
		{
			if (i != id)
			{
				patients[q] = buf[i];
				q++;
			}
		}

		delete[]buf;
	}
}
// ������ � ����� ���������
void chtenie()
{
	if (file1())
	{
		ifstream read(PName);

		if (read)
		{
			read >> patientkol;
		}
	}
	else
	{
		patientkol = 0;
	}
}
// ������ � ����� ������ 
void chteniel()
{
	if (file2())
	{
		ifstream readl(lName);
		string line;
		if (readl)
		{
			int num = 0;
			while (getline(readl, line))
			{
				++num;
				if (num == llech)
				{
					cout << "_____________________________________" << endl;
					cout << line << endl;
					cout << "_____________________________________" << endl;
				}
			}
		}
	}
	else
	{
		patientkol = 0;
	}
}
// ����� �� ����������
void Init(Boln* (&patients))
{
	if (patientkol != 0)
	{
		ifstream read(PName);

		if (read)
		{
			read >> patientkol;

			for (int i = 0; i < patientkol; i++)
			{
				read >> patients[i].kod;
				read >> patients[i].lech;
				read >> patients[i].diag;
				read >> patients[i].age;
			}
		}
	}
}


int main()
{
	setlocale(LC_ALL, "Rus");
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	chtenie();
	chteniel();
	Boln* patients = new Boln[patientkol];
	Init(patients);
	while (true)
	{
		DisplayOptions();
		switch (Command)
		{
		case 0:
			exit(0);
			break;
		case 1: 
			needToDisplay = false;
			Addpatient(patients);
			SaveData(patients);
			needToDisplay = true;
			break;
		case 2: 
			needToDisplay = false;
			DeleteBoln(patients);
			SaveData(patients);
			needToDisplay = true;
			break;
		case 3:
			needToDisplay = false;
			patients3(patients);
			needToDisplay = true;
			break;
		case 4:
			needToDisplay = false;
			cout << "������� ��� ��������: " << endl;
			cin >> patientkod;
			patients4(patients, patientkod);
			needToDisplay = true;
			break;
		case 5: 
			needToDisplay = false;
			patients5(patients, true);
			needToDisplay = true;
			break;
		case 6: 
			needToDisplay = false;
			cout << "������� ����� �������� �����: " << endl;
			cin >> llech;
			chteniel();
			needToDisplay = true;
			break;
		default:
			cout << "����� ������� ���" << endl; 
		}
	}
}