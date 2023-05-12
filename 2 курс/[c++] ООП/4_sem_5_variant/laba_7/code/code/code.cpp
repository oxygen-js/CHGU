#include <iostream>
#include <string>
#include <list>
#include <stack>
#include <random>
#include "TaxiClass.h"

const int ALL_TAXI = 10;
enum MenuEnum { Menu, PrintAll, Add, AddPositon, PopItem, Call, Recall, PrintOn, PrintOff, Exit };


void print_menu(int* code, MenuEnum* selection)
{
    int coutn_space = 2;
    std::cout << "\nМЕНЮ ТАКСИ" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[1] Вывод всех такси" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[2] Добавление такси в начало списка" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[3] Добавление такси перед определенным такси" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[4] Удаление выбранного такси" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[5] Вызвать такси" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[6] Отозвать такси" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[7] Показать все такси на вызове" << std::endl;
    std::cout << std::string(coutn_space, ' ') << "[8] Показать свободные такси" << std::endl;
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
        *selection = Call;
        break;
    case 6:
        *selection = Recall;
        break;
    case 7:
        *selection = PrintOn;
        break;
    case 8:
        *selection = PrintOff;
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

void _print_all_number(std::list<TaxiClass> container) {
    std::cout << "Все номера:\n";
    for (const auto item : container) {
        std::cout << "Такси #: " << item.number << std::endl;
    }
    std::cout << std::endl;
}

void print_all(std::stack<TaxiClass, std::list<TaxiClass>> arr) {
    system("cls");
    auto container = arr._Get_container();
    for (const auto item: container) {
        std::cout << "Такси \t#" << item.number
                  << "\nМарка:\t" << item.brand
                  << "\nВодитель:\t" << item.driver
                  << "\nАдрес: " << item.address
                  << "\nСтатус:\t" << (item.on_call ? "на вызове" : "свободно") 
        << std::endl << std::endl;
    }
}

void add(std::stack<TaxiClass, std::list<TaxiClass>> *arr) {
    system("cls");
    auto container = arr->_Get_container();

    int number;
    std::cout << "Такси #: "; std::cin >> number;
    std::string brand;
    std::cout << "Марка: "; std::cin >> brand;
    std::string driver;
    std::cout << "Водитель: "; std::cin >> driver;
    std::string address;
    std::cout << "Адрес: "; std::cin >> address;
    bool on_call = false;

    TaxiClass new_obj = TaxiClass(number, brand, driver, address, on_call);
    try
    {
        container.push_front(new_obj);
        int size_arr = arr->size();
        for (int i = 0; i < size_arr; i++) {
            arr->pop();
        }

        for (auto item : container) {
            arr->push(item);
        }

        std::cout << "\nВыполнено!" << std::endl;
    }
    catch (const std::exception&)
    {
        std::cout << "Ошибка добавления в начало." << std::endl;
    }
}

void add_position(std::stack<TaxiClass, std::list<TaxiClass>>* arr) {
    system("cls");
    auto container = arr->_Get_container();
    _print_all_number(container);

    int number_taxi = 1;
    std::cout << "Номер такси #: "; std::cin >> number_taxi;
    std::cout << std::endl;

    int number;
    std::cout << "Такси #: "; std::cin >> number; 
    std::string brand;
    std::cout << "Марка: "; std::cin >> brand;
    std::string driver;
    std::cout << "Водитель: "; std::cin >> driver;
    std::string address;
    std::cout << "Адрес: "; std::cin >> address;
    bool on_call = false;

    TaxiClass new_obj = TaxiClass(number, brand, driver, address, on_call);
    try
    {
        int size_arr = arr->size();
        for (int i = 0; i < size_arr; i++) {
            arr->pop();
        }

        auto index = container.begin();
        for (auto item : container) {
            if (item.number == number_taxi) {
                container.insert(index, new_obj);
            }
            index++;
        }

        for (auto item : container) {
            arr->push(item);
        }

        std::cout << "\nВыполнено!" << std::endl;
    }
    catch (const std::exception&)
    {
        std::cout << "Ошибка добавления." << std::endl;
    }
}

void pop_position(std::stack<TaxiClass, std::list<TaxiClass>>* arr) {
    system("cls");
    auto container = arr->_Get_container();
    _print_all_number(container);

    int position = 1;
    std::cout << "Номер #: "; std::cin >> position;
    std::cout << std::endl;

    try
    {
        int size_arr = arr->size();
        for (int i = 0; i < size_arr; i++) {
            arr->pop();
        }

        int i = 0;
        for (auto item : container) {
            if (position == item.number) {
                ++i;
                continue;
            }
            arr->push(item);
            i++;
        }

        std::cout << "\nВыполнено!" << std::endl;
    }
    catch (const std::exception&)
    {
        std::cout << "Ошибка удаления." << std::endl;
    }
}

void set_on_call(std::stack<TaxiClass, std::list<TaxiClass>>* arr, bool val) {
    system("cls");
    auto container = arr->_Get_container();
    _print_all_number(container);

    int number = 1;
    std::cout << "Номер Такси #: "; std::cin >> number;
    std::cout << std::endl;

    try
    {
        int size_arr = arr->size();
        for (int i = 0; i < size_arr; i++) {
            arr->pop();
        }

        for (auto item : container) {
            if (number == item.number) {
                item.on_call = val;
                std::cout << "Такси #" << item.number << " " << (item.on_call ? "на вызове" : "свободно") << std::endl;
            }
            arr->push(item);
        }

        std::cout << "\nВыполнено!" << std::endl;
    }
    catch (const std::exception&)
    {
        std::cout << "Ошибка вызова такси на заказ." << std::endl;
    }
}

void print_on_call(std::stack<TaxiClass, std::list<TaxiClass>>* arr, bool val) {
    system("cls");
    auto container = arr->_Get_container();

    std::cout << "Список такси которые " << (val ? "на вызове" : "свободно") << ":" << std::endl;

    for (auto item : container) {
        if (item.on_call == val) {
            std::cout << "Такси #" << item.number << std::endl;
        }
    }
}

void finish_command(MenuEnum* selection) {
    system("pause");
    system("cls");
    *selection = Menu;
}

void exit(MenuEnum* selection) {
    *selection = Exit;
}



int main()
{
    setlocale(LC_ALL, "Russian");
    std::cout << "\n\t\t\t\t\t\tВариант #5" << std::endl;

    int code;
    std::stack<TaxiClass, std::list<TaxiClass>> taxi_stack;
    MenuEnum selection = Menu;

    /* GENERATE */
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dist(100, 999);
    std::uniform_int_distribution<> dist_brand(1, 10);

    for (int i = 0; i < ALL_TAXI; i++) {
        int number = dist(gen);
        std::string brand = _get_brand_avto(dist_brand(gen));
        std::string driver = _get_driver_avto(dist_brand(gen));
        std::string address = "Чапаева д.18";
        TaxiClass *obj = new TaxiClass(number, brand, driver, address, true);
        taxi_stack.push(*obj);
    }

    /* MENU */
    while (selection != Exit) {
        switch (selection) {
        case Menu:
            print_menu(&code, &selection);
            break;
        case PrintAll:
            print_all(taxi_stack);
            finish_command(&selection);
            break;
        case Add:
            add(&taxi_stack);
            finish_command(&selection);
            break;
        case AddPositon:
            add_position(&taxi_stack);
            finish_command(&selection);
            break;
        case PopItem:
            pop_position(&taxi_stack);
            finish_command(&selection);
            break;
        case Call:
            set_on_call(&taxi_stack, true);
            finish_command(&selection);
            break;
        case Recall:
            set_on_call(&taxi_stack, false);
            finish_command(&selection);
            break;
        case PrintOn:
            print_on_call(&taxi_stack, true);
            finish_command(&selection);
            break;
        case PrintOff:
            print_on_call(&taxi_stack, false);
            finish_command(&selection);
            break;
        case Exit:
            exit(selection);
            break;
        default:
            break;
        }
    }


	return 0;
}
