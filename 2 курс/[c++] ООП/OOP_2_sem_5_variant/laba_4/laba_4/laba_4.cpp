#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

/*
* Вариант №5.
* Даны натуральное число n и целочисленный массив из n элементов. 
* В каждой группе подряд идущих одинаковых элементов оставить только один элемент.
* Если в массиве нет ни одной такой группы, выдать соответствующее сообщение.
*/

int main()
{	
	setlocale(LC_ALL, "Russian");

	int n = 1;
	vector<int> arr(n);
	vector<int> res;

	cout << "Количество элементов в массиве: ";
	cin >> n;
	for (int i = 0; i < n; i++)
	{
		int num = 0;
		cout << "arr[" << i << "]: ";
		cin >> num;
		arr.push_back(num);
	}
	

	int stack = 0;
	for (vector<int>::iterator i = arr.begin(); i != arr.end(); i++)
	{
		if (*i != stack) 
		{
			stack = *i;
			res.push_back(*i);
		}
	}


	cout << "RES: ";
	for (vector<int>::iterator i = res.begin(); i != res.end(); i++)
	{
		cout << *i << ", ";
	}
}
