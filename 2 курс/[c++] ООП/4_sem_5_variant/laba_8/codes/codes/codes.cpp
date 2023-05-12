#include <iostream>
#include <vector>
#include <random>

using namespace std;

template <typename T>
void print_arr(const T& vec) {
    if (vec.size() == 0) {
        cout << "Vector empty!" << endl;
        return;
    }

    for (const auto& el : vec)
        cout << el << ", ";
    cout << endl;
}

template <typename T>
void fill(const T& vec, int size) {
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dist(1, 10);

    for (int i = 0; i < size; i++)
    {
        vec->push_back(dist(gen));
    }
}   

int main()
{
    setlocale(LC_ALL, "Russian");

    int size_arr_1 = 1;
    int size_arr_2 = 1;
    cout << "Введите длину массива #1: "; cin >> size_arr_1;
    cout << "Введите длину массива #2: "; cin >> size_arr_2;
    cout << endl;

    cout << "\nГенерация случайных чисел...\n" << endl;

    std::vector<int> vec_1;
    std::vector<int> vec_2;

    fill(&vec_1, size_arr_1);
    fill(&vec_2, size_arr_2);
    print_arr(vec_1);
    print_arr(vec_2);

    return 0;
}

/*
Даны векторы V1 и V2 с различным количеством элементов. 

Найти все числа (с учетом повторений), которые входят в один из исходных векторов и отсутствуют в другом, и вывести их в порядке убывания; при этом если,
например, некоторое число входит в один из векторов 3 раза, а в другой 5 раз, то его надо вывести 2 раза. Использовать алгоритм set_symmetric_difference для
двух вспомогательных мультимножеств и итератора ptout_iterator. Чтобы обеспечить вывод чисел в нужном порядке, при создании множеств и в алгоритме
использовать функциональный объект greater.
*/