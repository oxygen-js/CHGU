#include <iostream>


void generate(int* arr, int arr_size, int fill_num)
{
	for (int i = 0; i < arr_size; i++)
	{
		arr[i] = fill_num;
	}
}


int main()
{
	int n, m;
	std::cin >> n;
	std::cin >> m;

	int max_size = (n > m) ? n : m;
	int min_size = (n > m) ? m : n;

	int* a = new int(n);
	int* b = new int(m);
	int* ptr_max_arr = n > m ? a : b;
	int* c = new int(max_size);

	for (int i = 0; i < n; i++)
	{
		a[i] = 1;
	}

	for (int i = 0; i < m; i++)
	{
		b[i] = 2;
	}

	for (int i = 0; i < min_size; ++i)
	{
		c[i] = a[i];
		c[i] = b[i];
	}

	for (int i = min_size; i < max_size; i++)
	{
		c[i] = ptr_max_arr[i];
	}


	for (int i = 0; i < max_size; i++)
	{
		std::cout << c[i] << ", ";
	}


	return 0;
}

/*
* ЗАДАЧА. Вариант №5:
* Даны натуральные числа n, m и массивы a и b одного типа из n и m элементов соответственно.
* Получить массив c из n+m элементов, чередуя элементы массивов a и b.
* Оставшиеся элементы наиболее длинного массива разместить в конце массива c.
*/
