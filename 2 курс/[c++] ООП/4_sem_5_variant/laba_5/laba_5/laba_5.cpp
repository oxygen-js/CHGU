#include <iostream>
#include <string>
#include <vector>


void print_header() 
{
	std::cout << "LABA #" << 5 << ". Variant #" << 5 << std::endl;
	std::cout << "TASK:\n" << "Даны натуральные числа n, m и массивы a и b одного типа из n и m элементов соответственно. Получить массив c из n+m элементов, чередуя элементы массивов a и b. Оставшиеся элементы наиболее длинного массива разместить в конце массива c." << '\n' << std::endl;
}


void print(std::vector<int> arr, int arr_size)
{
	for (int i = 0; i < arr_size; i++)
		std::cout << arr[i] << ", ";
	std::cout << std::endl;
}


int main()
{
	setlocale(LC_ALL, "Russian");
	print_header();

	int n = 0;
	int m = 0;
	std::cout << "N: "; std::cin >> n;
	std::cout << "M: ";	std::cin >> m;
	std::cout << std::endl;

	int c_size = n + m;
	std::vector<int> a;
	std::vector<int> b;
	std::vector<int> c;

	std::cout << "A: ";
	for (int i = 0; i < n; i++) a.push_back(1);
	print(a, n);

	std::cout << "B: ";
	for (int i = 0; i < m; i++) b.push_back(2);
	print(b, m);

	
	std::cout << "C: ";
	int it_a = 0;
	int it_b = 0;
	for (int i = 0; i < c_size; i++)
	{
		if (it_a < n) {
			c.push_back(a[it_a++]);
		}

		if (it_b < m) {
			c.push_back(b[it_b++]);
		}
	}
	print(c, c_size);

	return 0;
}
