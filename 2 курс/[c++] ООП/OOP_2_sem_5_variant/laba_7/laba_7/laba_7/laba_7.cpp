#include <iostream>
#include <string>
#include <list>
#include <stack>
#include "functions.h"
#include "TaxiClass.h"


int main()
{
    system("clear");
    std::cout << "\n\t\t\t\t\t\tTASK OPTION #5" << std::endl;

    int code;
    std::stack<TaxiClass, std::list<TaxiClass>> taxi_stack;
    MenuEnum selection = Menu;

    while (selection != Exit) {
        call_task(&selection, &code);
    }

    taxi_stack.emplace(generate_all_taxi());

    return 0;
}
