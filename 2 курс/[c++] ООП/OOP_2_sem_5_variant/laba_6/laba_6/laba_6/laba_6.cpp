#include <iostream>
#include <list>
#include <deque>

int laba_6_deque()
{
	int n;
	std::cout << "N: "; std::cin >> n; std::cout << std::endl;

	std::deque<int> lst, stage, result_lst;

	for (int i = 0; i < n; i++) {
		lst.push_back((rand() % 20 - rand() % 10));
	}

	std::cout << "deque: ";
	for (auto item : lst) {
		std::cout << item << ", ";
	}
	std::cout << std::endl;


	for (auto i : lst) {
		if (i > 0) {
			stage.push_back(i);
		}
		else {
			if (stage.size() > result_lst.size()) {
				result_lst.clear();
				for (auto i_stg : stage) {
					result_lst.push_back(i_stg);
				}
			}
			stage.clear();
		}
	}

	std::cout << "result: ";
	for (auto item : result_lst) {
		std::cout << item << ", ";
	}
	std::cout << std::endl;

	return 0;
}

int laba_6_list()
{
	int n;
	std::cout << "N: "; std::cin >> n; std::cout << std::endl;

	std::list<int> lst, stage, result_lst;

	for (int i = 0; i < n; i++) {
		lst.push_back((rand() % 20 - rand() % 10));
	}

	std::cout << "list: ";
	for (auto item : lst) {
		std::cout << item << ", ";
	}
	std::cout << std::endl;


	for (auto i : lst) {
		if (i > 0) {
			stage.push_back(i);
		}
		else {
			if (stage.size() > result_lst.size()) {
				result_lst.clear();
				for (auto i_stg : stage) {
					result_lst.push_back(i_stg);
				}
			}
			stage.clear();
		}
	}

	std::cout << "result: ";
	for (auto item : result_lst) {
		std::cout << item << ", ";
	}
	std::cout << std::endl;

	return 0;
}


int main()
{
	laba_6_list();
	laba_6_deque();
	return 0;
}

/*	
	Даны натуральное число n и массив из n вещественных чисел. 
	Найти самую длинную серию из положительных чисел, представляющих возрастающую последовательность
*/
