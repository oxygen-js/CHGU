#include <iostream>
#include <string>
#include <queue>
#include <vector>
#include <stdlib.h> 
#include <windows.h>
#include <iomanip>
#include <sstream>

using namespace std;

const string TEXT = "У лукоморья дуб зелёный; Златая цепь на дубе том: И днём и ночью кот учёный Всё ходит по цепи кругом; Идёт направо — песнь заводит, Налево — сказку говорит. Там чудеса: там леший бродит, Русалка на ветвях сидит; Там на неведомых дорожках Следы невиданных зверей; Избушка там на курьих ножках Стоит без окон, без дверей; Там лес и дол видений полны; Там о заре прихлынут волны На брег песчаный и пустой, И тридцать витязей прекрасных Чредой из вод выходят ясных, И с ними дядька их морской; Там королевич мимоходом Пленяет грозного царя; Там в облаках перед народом Через леса, через моря Колдун несёт богатыря; В темнице там царевна тужит, А бурый волк ей верно служит; Там ступа с Бабою Ягой Идёт, бредёт сама собой, Там царь Кащей над златом чахнет; Там русский дух… там Русью пахнет! И там я был, и мёд я пил; У моря видел дуб зелёный; Под ним сидел, и кот учёный Свои мне сказки говорил.";

void print_header();
void get_cons_buff(int&, int&);
void center_string(string&, const size_t&);

template<typename T>
void view_container(T data);

template<typename T, typename T2>
void replace_index(T new_value, int pos, T2* data);

int main()
{
    setlocale(LC_ALL, "Russian");
    print_header();

    int size = 1;
    queue<char> c_qu;
    vector<char> c_vec;

    do {
        cout << "Длина контейнера: "; cin >> size;
        if (size > TEXT.length()) {
            cout << "Длина контейнера не должна превышать " << TEXT.length() << " символов" << endl;
        }
    } while (size > TEXT.length());


    cout << "1. Создать объект-контейнер \"queue <char>\" и заполнить его данными";
    for (size_t i = 0; i < size; i++) {
        c_qu.push(TEXT[i]);
        c_vec.push_back(TEXT[size+i]);
    }
    //Sleep(300); cout << "."; Sleep(300); cout << "."; Sleep(300); cout << "."; Sleep(300); cout << "." << endl;
    
    cout << "2. Просмотреть контейнер." << endl;
    view_container(c_qu); cout << "\n" << endl;


    cout << "3. Изменить контейнер, удалив из него одни элементы и заменив другие." << endl;
    int pos = 0;
    string new_value = "";
    cout << "Новая строка: "; cin >> new_value;
    cout << "Позиция для вставки: "; cin >> pos;
    replace_index(new_value, pos, &c_qu);
    cout << endl;


    cout << "4. Просмотреть контейнер, используя для доступа к его элементам итераторы." << endl;
    view_container(c_qu);
    cout << endl;


    cout << "5. Создать второй контейнер этого же класса и заполнить его данными того же типа, что и первый контейнер." << endl;
    for (size_t i = 0; i < size; i++) {
        c_vec.push_back(TEXT[size + i]);
    }
    Sleep(300); cout << "."; Sleep(300); cout << "."; Sleep(300); cout << "."; Sleep(300); cout << "." << endl;
    
    
    cout << "6. Изменить первый контейнер, удалив из него n элементов после заданного и добавив затем в него все элементы из второго контейнера." << endl;
    int pos_del = 0;
    cout << "Позиция для вставки контейнера №2: "; cin >> pos_del;
    replace_index(c_vec, pos_del, &c_qu);
    cout << endl;

    cout << "7. Просмотреть первый и второй контейнеры." << endl;
    view_container(c_qu);
    for (auto c : c_vec) cout << c;
    

    return 0;
}


void print_header() {
    system("title KAZAKOV A.Y. (KT-43-21)");
    string title = "Курсовая работа - КАЗАКОВ А.Ю. (KT-43-21)";
    string variant = "Вариант #5. Задание №1";
    center_string(title, 42u);
    center_string(variant, 30u);
    cout << endl;
}

template<typename T>
void view_container(T data) { 
    auto container = data._Get_container();
    for (auto c : container) {
        cout << c;
    }
    cout << endl;
}

template<typename T, typename T2>
void replace_index(T new_value, int pos, T2* data) {
    auto buff = data->_Get_container();
    deque<char>::iterator it = buff.begin() + pos;
    buff.erase(it);

    for (int i = 0; i < new_value.size(); i++) {
        buff.insert(buff.begin() + pos + i, new_value[i]);
    }

    while (data->size() != 0) data->pop();
    for (auto s: buff) data->push(s);
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

/* Первая программа демонстрирует использование контейнерных классов для хранения встроенных типов данных. */

// 1 контейнер - queue
// 2 контейнер - vector
// Встроенный тип данных - char
/*
В программе № 1 выполнить следующее:
1. Создать объект-контейнер "queue<char>" и заполнить его данными.
2. Просмотреть контейнер.
3. Изменить контейнер, удалив из него одни элементы и заменив другие.
4. Просмотреть контейнер, используя для доступа к его элементам итераторы.
5. Создать второй контейнер этого же класса и заполнить его данными того же типа, что и первый контейнер.
6. Изменить первый контейнер, удалив из него n элементов после заданного и добавив затем в него все элементы из второго контейнера.
7. Просмотреть первый и второй контейнеры.
*/
