#pragma once
#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_

enum MenuEnum { Menu, PrintAll, Add, AddPositon, PopItem, PrintOn, PrintOff, Back, Exit };

void print_menu(int* code, MenuEnum* selection);

template<typename T>
std::stack<T, std::list<T>> generate_all_taxi();

void print_all();
void add();
void add_position();
void pop_position();
void print_on();
void back(int* code, MenuEnum* selection);
void exit(MenuEnum* selection);

void call_task(MenuEnum* selection, int* code);

#endif // !_TAXI_H_
