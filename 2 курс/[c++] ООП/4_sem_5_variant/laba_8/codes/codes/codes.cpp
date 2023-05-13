#include <iostream>
#include <algorithm>
#include <vector>
#include <set>
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

    vector<int> vec_1;
    vector<int> vec_2;

    fill(&vec_1, size_arr_1);
    fill(&vec_2, size_arr_2);


    multiset<int, greater<int>> set1(vec_1.begin(), vec_1.end());
    multiset<int, greater<int>> set2(vec_2.begin(), vec_2.end());

    for (int x : vec_1) { set1.insert(x); }
    for (int x : vec_2) { set2.insert(x); }

    print_arr(set1);
    print_arr(set2);

    set_symmetric_difference(
        set1.begin(), set1.end(),
        set2.begin(), set2.end(),
        ostream_iterator<int>(cout, " "), greater<int>{}
    );

    return 0;
}
