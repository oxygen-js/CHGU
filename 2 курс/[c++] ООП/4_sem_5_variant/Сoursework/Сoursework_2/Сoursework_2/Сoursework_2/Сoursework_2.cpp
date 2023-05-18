#include <iostream>
#include <string>
#include <queue>
#include <vector>
#include <stdlib.h> 
#include <windows.h>
#include <iomanip>
#include <sstream>

using namespace std;

void print_header();
void get_cons_buff(int&, int&);
void center_string(string&, const size_t&);

template<typename T>
void view_container(T data);

class Country {
public:
    Country(){}
    Country(string in_name, string in_form_government, float in_area) {
        this->set_name(in_name);
        this->set_area(in_area);
        this->set_form_government(in_form_government);
    }
    float  get_area() const { return area; }
    string get_name() const { return name; }
    string get_form_government() const { return form_government; }


    void set_name(string in_name) { name = in_name; }
    void set_area(float in_area) { area = in_area; }
    void set_form_government(string in_form_government) { form_government = in_form_government; }

    friend ostream& operator << (ostream& os, const Country& obj) {
        return os << "Название: " << obj.get_name() << "\nФорма правления: " << obj.get_form_government() << "\nПлощадь: " << obj.get_area() << endl;
    }

    friend istream& operator >> (istream& in, Country& obj) {
        float in_area;
        string in_name;
        string in_form_government;
        cout << "Название: "; in >> in_name;
        cout << "Форма правления: "; in >> in_form_government;
        cout << "Площадь: "; in >> in_area;
        cout << endl;

        if (in) {
            obj.set_name(in_name);
            obj.set_area(in_area);
            obj.set_form_government(in_form_government);
        }
        
        return in;
    }

private:
    string name = "Not defined";
    string form_government = "Not defined";
    float area = 1;
};


int main()
{
    setlocale(LC_ALL, "Russian");
    print_header();
    int size = 1;
    cout << "1. Создать объект-контейнер и заполнить его данными." << endl;
    cout << "Количество объектов: "; cin >> size;
    queue<Country> que;
    for (int i = 0; i < size; i++) {
        Country obj;
        cin >> obj;
        que.push(obj);
    }

    view_container(que);
    

    return 0;
}


template<typename T>
void view_container(T data) {
    auto container = data._Get_container();
    for (auto c : container) {
        cout << c;
    }
    cout << endl;
}

void print_header() {
    system("title KAZAKOV A.Y. (KT-43-21)");
    string title = "Курсовая работа - КАЗАКОВ А.Ю. (KT-43-21)";
    string variant = "Вариант #5. Задание №2";
    center_string(title, 42u);
    center_string(variant, 30u);
    cout << endl;
}

void get_cons_buff(int& x, int& y)
{

    HANDLE hWndConsole;
    if (hWndConsole = GetStdHandle(-12))
    {
        CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
        if (GetConsoleScreenBufferInfo(hWndConsole, &consoleInfo))
        {
            x = consoleInfo.srWindow.Right - consoleInfo.srWindow.Left + 1;
            y = consoleInfo.srWindow.Bottom - consoleInfo.srWindow.Top + 1;
        }
        else
            printf("Error: %d\n", GetLastError());
    }
    else
        printf("Error: %d\n", GetLastError());
}

void center_string(string& s, const size_t& width)
{
    int buffer_x_size, buffer_y_size;
    get_cons_buff(buffer_x_size, buffer_y_size);
    size_t left_bord = (buffer_x_size - width) / 2.;
    for (;;)
    {
        cout << setw(left_bord) << "";
        cout << s.substr(0u, width) << endl;
        s.erase(s.begin(), s.begin() + (s.size() < width ? s.size() : width));
        if (s.empty())
        {
            break;
        }
    }
}

/*

Порядок выполнения работы.
1. Создать объект-контейнер в соответствии с вариантом задания и заполнить его данными, тип которых определяется вариантом задания.
2. Просмотреть контейнер.
3. Изменить контейнер, удалив из него одни элементы и заменив другие.
4. Просмотреть контейнер, используя для доступа к его элементам итераторы.
5. Создать второй контейнер этого же класса и заполнить его данными того же типа, что и первый контейнер.
6. Изменить первый контейнер, удалив из него n элементов после заданного и добавив затем в него все элементы из второго контейнера.
7. Просмотреть первый и второй контейнеры.

Методические указания
1. В качестве пользовательского типа данных использовать пользовательский класс (см. Приложение 1).
2. При создании контейнеров в программе № 2 объекты загружать из потока.
3. Для вставки и удаления элементов контейнера в программе № 2 использовать соответствующие операции, определенные в классе контейнера.
7. Условия поиска и замены элементов выбираются самостоятельно и для них пишется функция-предикат.
8. Для ввода-вывода объектов пользовательского класса следует перегрузить операции “>>” и “<<”.

Варианты заданий
----------------------------------------------
№ п/п | контейнер #1 | контейнер #2 |  Тип   | 
------|--------------|--------------|--------|
  5	  |    queue	 |   vector     | Страна |
----------------------------------------------
 
Польз. тип
    class СТРАНА {
        имя – string
        форма правления – string
        площадь – float
    }

*/
