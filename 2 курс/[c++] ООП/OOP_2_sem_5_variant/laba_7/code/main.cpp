#include <iostream>
#include <string>
#include <list>
#include <stack>

class Taxi
{
public:
  int number;
  std::string stamp;
  std::string driver;
  std::string address;
  bool on_call;
};

void print_menu(int *code)
{
  int coutn_space = 2;
  std::cout << "\nMENU TAXI" << std::endl;
  std::cout << std::string (coutn_space, ' ') << "[1] PRINT ALL" << std::endl;
  std::cout << std::string (coutn_space, ' ') << "[2] ADD in start list" << std::endl;
  std::cout << std::string (coutn_space, ' ') << "[3] ADD by index" << std::endl;
  std::cout << std::string (coutn_space, ' ') << "[4] DEL by index" << std::endl;
  std::cout << "\nSelect menu: ";
  std::cin >> *code;
  std::cout << std::endl;
}

int main()
{
  system("clear");
  std::cout << "\n\t\t\t\t\t\tTASK OPTION #5"
            << std::endl;

  std::stack<Taxi, std::list<Taxi>> stask;
  int code;
  print_menu(&code);

  std::cout << code << std::endl;

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