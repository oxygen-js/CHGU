// Вариант #5. Подсчитать среднее арифметическое отрицательных элементов.
#include <iostream>

template <typename T1, typename T2, typename T3>
void print(T1** arr, T2 S, T2 C, T3 num) {
	std::cout << "\nPRINT\n" << std::endl;
	for (int i = 0; i < S; i++) {
		for (int j = 0; j < C; j++) {
			std::cout << "arr" << "[" << i << "][" << j << "] : " << (T3)arr[i][j] << std::endl;
		}
	}
}

template <typename T1, typename T2>
T1 generate(T1 **arr, T2 S, T2 C) {
	T1 size_max = 0;
	for (int i = 0; i < S; i++) {
		for (int j = 0; j < C; j++) {
			std::cout << "Element" << "[" << i << "][" << j << "] : ";
			std::cin >> arr[i][j];
			if (size_t(arr[i][j]) > size_max) {
				size_max = arr[i][j];
			}
		}
	}

	return (T1)size_max;
}

template <typename T1, typename T2>
void average(T1** arr, T2 S, T2 C) {
	T1 result = 0;
	T2 count = 0;
	for (int i = 0; i < S; ++i) {
		for (int j = 0; j < C; ++j) {
			if (arr[i][j] < 0) {
				result += arr[i][j];
				++count;
			}
		}
	}

	std::cout << (T1)(result / count) << std::endl;
}


int main()
{
	int S, C;
	std::cin >> S;
	std::cin >> C;

	double** arr;
	arr = new double*[S];
	for (int i = 0; i < S; i++) {
		arr[i] = new double[C];
	}

	print(arr, S, C, generate(arr, S, C));
	average(arr, S, C);

	return 0;
}
