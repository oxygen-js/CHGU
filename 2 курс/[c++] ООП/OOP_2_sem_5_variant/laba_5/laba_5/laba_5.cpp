#include <iostream>
#include <string>


void print_header(const int title, const int variant, const std::string task) 
{
	std::cout << "LABA #" << title << ". Variant #" << variant << std::endl;
	std::cout << "TASK:\n" << task << '\n' << std::endl;
}


void print(int* arr, int arr_size)
{
	for (int i = 0; i < arr_size; i++)
		std::cout << arr[i] << ", ";
	std::cout << std::endl;
}


int main()
{
	setlocale(LC_ALL, "Russian");
	print_header(5, 5, "Даны натуральные числа n, m и массивы a и b одного типа из n и m элементов соответственно. Получить массив c из n+m элементов, чередуя элементы массивов a и b. Оставшиеся элементы наиболее длинного массива разместить в конце массива c.");

	int n = 0;
	int m = 0;
	std::cout << "N: "; std::cin >> n;
	std::cout << "M: ";	std::cin >> m;
	std::cout << std::endl;

	int c_size = n + m;
	int* a = new int(n);
	int* b = new int(m);
	int* c = new int(c_size);
	int* ptr_max_arr = n > m ? a : b;

	std::cout << "A: ";
	for (int i = 0; i < n; i++) a[i] = 1;
	print(a, n);

	std::cout << "B: ";
	for (int i = 0; i < m; i++) b[i] = 2;
	print(b, m);

	
	std::cout << "C: ";
	int it_a = 0;
	int it_b = 0;
	for (int i = 0; i < c_size;i)
	{
		if (it_a < n) {
			c[i] = a[it_a++];
			i++;
		}

		if (it_b < m) {
			c[i] = b[it_b++];
			i++;
		}
	}
	print(c, c_size);

	return 0;
}
