#include <iostream>
#include <list>
#include <stack>
#include <random>
#include "functions.h"
#include "TaxiClass.h"


void print_menu(int* code, MenuEnum* selection)
{
    int coutn_space = 2;
    std::cout << "\nMENU TAXI" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[1] PRINT ALL" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[2] ADD in start list" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[3] ADD by index" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[4] DEL by index" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[5] Print on call" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[6] Print off call" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[q] EXIT" << std::endl;
    std::cout << "\nSelect menu: ";
    std::cin >> *code;
    switch (*code) {
    case 0:
        *selection = Menu;
        break;
    case 1:
        *selection = PrintAll;
        break;
    case 2:
        *selection = Add;
        break;
    case 3:
        *selection = AddPositon;
        break;
    case 4:
        *selection = PopItem;
        break;
    case 5:
        *selection = PrintOn;
        break;
    case 6:
        *selection = PrintOff;
        break;
    case 7:
        *selection = Back;
        break;
    default:
        *selection = Exit;
        break;
    }
    std::cout << std::endl;
}

std::string _get_brand_avto(int num) {
    switch (num) {
    case 1:
        return "Lada - Vesta";
    case 2:
        return "Volvo - S60";
    case 3:
        return "Haval - H5";
    case 4:
        return "Audi - A8";
    case 5:
        return "BMW - X6";
    case 6:
        return "Mercedes - GLS";
    case 7:
        return "Volkswagen - Jetta";
    case 8:
        return "Bugati - Verone";
    case 9:
        return "Toyota - Cruse";
    case 10:
        return "Renault - logon";
    default:
        return "NONE_BRAND";
    }
}

std::string _get_driver_avto(int num) {
    switch (num) {
    case 1:
        return "Ivanov A.A.";
    case 2:
        return "Petrov G.G.";
    case 3:
        return "Aleksandrov A.A.";
    case 4:
        return "Kazakov A.Y.";
    case 5:
        return "Mokeev S.G.";
    case 6:
        return "Mongolov A.A.";
    case 7:
        return "Kulikova S.M.";
    case 8:
        return "Zondarev P.A.";
    case 9:
        return "Nikitin A.A.";
    case 10:
        return "Nikitin S.A.";
    default:
        return "Robot";
    }
}

template<typename T>
std::stack<T, std::list<T>> generate_all_taxi() {
    std::stack<TaxiClass, std::list<TaxiClass>> taxi_stack;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dist(100, 999);
    std::uniform_int_distribution<> dist_brand(1,10);

    int number = dist(gen);
    std::string brand = _get_brand_avto(dist_brand(gen));
    std::string driver = _get_driver_avto(dist_brand(gen));
    std::string address = "Chapaeva d." + (dist(gen));

    for (int i = 0; i < 10; i++) {
        TaxiClass obj = TaxiClass(number, brand, driver, address, true);
        taxi_stack.push(obj);
    }

    return taxi_stack;
}

void print_all() {
}

void add() {
}

void add_position() {
}

void pop_position() {
}

void print_on() {
}

void back(int* code, MenuEnum* selection) {
    system("clear");
    print_menu(code, selection);
}

void exit(MenuEnum* selection) {
    *selection = Exit;
}

void call_task(MenuEnum* selection, int* code) {
    switch (*selection) {
    case Menu:
        print_menu(code, selection);
        break;
    case PrintAll:
        print_all();
        break;
    case Add:
        add();
        break;
    case AddPositon:
        add_position();
        break;
    case PopItem:
        pop_position();
        break;
    case PrintOn:
        back(code, selection);
        break;
    case PrintOff:
        back(code, selection);
        break;
    case Back:
        back(code, selection);
        break;
    case Exit:
        exit(selection);
        break;
    default:
        break;
    }
}
