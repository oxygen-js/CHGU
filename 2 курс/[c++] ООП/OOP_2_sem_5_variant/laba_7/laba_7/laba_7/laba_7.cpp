#include <iostream>
#include <string>
#include <list>
#include <stack>

enum MenuEnum { Menu, PrintAll, Add, AddPositon, PopItem, PrintOn, PrintOff, Back, Exit };

class Taxi
{
public:
    int number;
    std::string stamp;
    std::string driver;
    std::string address;
    bool on_call;
};

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

void print_all() {}
void add() {}
void add_position() {}
void pop_position() {}
void print_on() {}
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

int main()
{
    system("clear");
    std::cout << "\n\t\t\t\t\t\tTASK OPTION #5" << std::endl;

    int code;
    std::stack<Taxi, std::list<Taxi>> stask;
    MenuEnum selection = Menu;

    while (selection != Exit) {
        call_task(&selection, &code);
    }

    return 0;
}

/*Решить задачу, используя стек или очередь*/

/*
Составить программу, которая содержит динамическую информацию о такси.

Сведения о каждом такси включают:
· номер такси;
· марка автомобиля;
· фамилию и инициалы водителя;
· признак того, где находится такси — на вызове или в свободное.

Программа должна обеспечивать:
· начальное формирование данных обо всех такси в виде стека или очереди;
· вывод всех такси;
· добавление такси в начало списка;
· добавление такси перед определенным такси;
· удаление выбранного такси.
· при выезде каждого такси вводится номер такси, и программа
устанавливает значение признака «такси на вызове»;
· при освобождении такси вводится номер такси, и программа устанавливает
значение признака «такси свободное»;
· по запросу выдаются сведения о свободных такси, или о такси,
находящихся на выезде.
*/

/*

  string code_menu = "print_all" | "add" | "add_positon" | "pop_item" | "print_on" | | "print_off" | "back" | "exit"

*/

/*
  std::cout << "┌──────────────┐\n"
            << "|" << "Taxi #772     " << "|\n"
               "|" << "              " << "|\n"
               "|" << "M: Audi       " << "|\n"
               "|" << "D: Anton A.A. " << "|\n"
               "|" << "ON: [-]       " << "|\n"
               "└──────────────┘"
            << std::endl;
*/