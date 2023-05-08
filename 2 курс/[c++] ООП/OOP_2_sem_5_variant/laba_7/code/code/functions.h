#pragma once
#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_

enum MenuEnum { Menu, PrintAll, Add, AddPositon, PopItem, PrintOn, PrintOff, Back, Exit };

void print_menu(int* code, MenuEnum* selection);

template<typename T>
void print_all(T arr);

template<typename T>
void call_task(MenuEnum* selection, int* code, T arr);

void add();
void add_position();
void pop_position();
void print_on();
void back(int* code, MenuEnum* selection);
void exit(MenuEnum* selection);

std::string get_brand_avto(int num);
std::string get_driver_avto(int num);

#endif
