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

void GetConsBuff(int&, int&);
void CenterString(string&, const size_t&);

template<typename T>
void view_container(T data) { // Просмотреть контейнер
    auto container = data._Get_container();
    for (auto c : container) {
        cout << c;
    }
    cout << endl;
}

void update_dat(queue<char> data) { // Изменить контейнер, удалив из него одни элементы и заменив другие 
       
}

int main()
{
    setlocale(LC_ALL, "Russian");
    system("title Cours Work by KAZAKOV A.Y. (KT-43-21)");
    string title = "Курсовая работа - КАЗАКОВ А.Ю. (KT-43-21)";
    string variant = "Вариант #5";
    CenterString(title, 42u);
    CenterString(variant, 11u);
    cout << endl;

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
    }
    Sleep(500); cout << "."; Sleep(500); cout << "."; Sleep(500); cout << "."; Sleep(500); cout << ".\n" << endl;
    
    cout << "2. Просмотреть контейнер: " << endl;
    view_container(c_qu);

    return 0;
}

void GetConsBuff(int& x, int& y)
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

void CenterString(string& s, const size_t& width)
{
    int buffer_x_size, buffer_y_size;
    GetConsBuff(buffer_x_size, buffer_y_size);
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
