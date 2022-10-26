#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include "fraction.h"
using namespace std;

int main()
{

    double a;
    cout << "a: "; cin >> a;

    Piramida pirm_1 = Piramida(10, 5);
    Piramida pirm_2 = Piramida(10, 5);
    Piramida pirm_3 = Piramida(10, 5);

    double arr_prims[] = {
        pirm_1.amount(pirm_1.H, pirm_1.a), 
        pirm_2.amount(pirm_2.H, pirm_2.a), 
        pirm_3.amount(pirm_3.H, pirm_3.a)
    };

    vector <double> sort_double_vector(arr_prims, arr_prims + 8);
    sort(sort_double_vector.begin(), sort_double_vector.end());

    cout << "Min S: " << sort_double_vector[0] << endl;
    

    
    


    // Square square = Square(3);
    // cout << "Area: "      << square.area();
    // cout << "Diagonal: "  << square.diagonal();
    // cout << "Perimeter: " << square.perimeter();

    // Square square_1 = Square(4);
    // cout << "Area: "      << square_1.area();
    // cout << "Diagonal: "  << square_1.diagonal();
    // cout << "Perimeter: " << square_1.perimeter();

    // Square square_2 = Square(5);
    // cout << "Area: "      << square_2.area();
    // cout << "Diagonal: "  << square_2.diagonal();
    // cout << "Perimeter: " << square_2.perimeter();

    // Square square_3 = Square(6);    
    // cout << "Area: "      << square_3.area();
    // cout << "Diagonal: "  << square_3.diagonal();
    // cout << "Perimeter: " << square_3.perimeter();



    return 0;
}