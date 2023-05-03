#include <iostream>
#include "functions.h"


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
    std::cout << std::string(coutn_space, ' ') << "[-1] EXIT" << std::endl;
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
