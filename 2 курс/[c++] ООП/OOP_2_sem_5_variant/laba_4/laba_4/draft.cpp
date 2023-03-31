//#include <iostream>
//#include <string>
//using namespace std;
//
///*
//	Даны натуральное число n и целочисленный массив из n элементов.
//	В каждой группе подряд идущих одинаковых элементов оставить только один элемент.
//	Если в массиве нет ни одной такой группы, выдать соответствующее сообщение.
//*/
//
//template <typename Out> void OutputMas(Out* massiv, int n)
//{
//	for (int i = 0; i < n; i++)
//	{
//		cout«massiv[i]«endl;
//	}
//}
//
//template <typename Inp> void InputMas(Inp* massiv, int n)
//{
//	for (int i = 0; i < n; i++)
//	{
//		cin»massiv[i];
//	}
//}
//
//template <typename Repl> void ReplaceStr(Repl* massiv, int n)
//{
//	int fn;
//	for (int i = 0; i < n; i++)
//	{
//		fn = massiv[i].find("ab");
//		if (fn != -1)
//		{
//			massiv[i].replace(fn, 2, "ccc");
//		}
//	}
//}
//
//template <typename Str> string AppStr(Str* massiv, int n)
//{
//	int len;
//	string stroka;
//	for (int i = 0; i < n; i++)
//	{
//		len = massiv[i].length();
//		if (len > 1)
//		{
//			stroka.append(massiv[i], len - 2, 2);
//		}
//	}
//	return stroka;
//}
//
//int main()
//{
//	int n;
//	cout << "Введите кол-во слов в массиве: ";
//	cin >> n;
//	string* mas;
//	mas = new string[n];
//
//	InputMas(mas, n);
//	ReplaceStr(mas, n);
//	cout << endl << "Преобразованный массив: " << endl;
//	OutputMas(mas, n);
//
//	string ln = AppStr(mas, n);
//	for (int i = 0; i < n; i++)
//	{
//		if (mas[i].find_first_of(ln) == -1)
//		{
//			cout << mas[i] << " ";
//		}
//	}
//}
