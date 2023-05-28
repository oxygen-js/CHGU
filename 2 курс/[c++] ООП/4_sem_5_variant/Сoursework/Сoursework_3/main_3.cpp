#include <iostream>
#include <string>
#include <queue>
#include <vector>
#include <deque>

using namespace std;

class Country {
public:
    Country() {}
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

    friend bool operator < (const Country& lhs, const Country& rhs) {
        return lhs.get_name() < rhs.get_name();
    }

private:
    string name = "Not defined";
    string form_government = "Not defined";
    float area = 1;
};

    bool compare(const Country& lhs, const Country& rhs) {
        return lhs.get_name() > rhs.get_name();
    }

template<typename T>
void print_container(T data);

template<typename T>
void sort_containers(T* data);

template<typename T>
void sort_containers_desc(T* data);

template<typename T>
void find_obj(T data);

template<typename T1, typename T2>
void move_obj(T1* c1, T2* c2);

template<typename T1, typename T2, typename T3>
void merge_containers(T1* gen, T2 c1, T3 c2);

template<typename T>
void search_occurrences(vector<T> gen);

template<typename T>
void search_obj(vector<T> gen);

int main()
{
    system("chcp 1251");

    cout << "1. Создать контейнер, содержащий объекты пользовательского типа." << endl;
    int size = 1;
    cout << "Количество объектов: "; cin >> size;
    queue<Country> c_queue;
    for (int i = 0; i < size; i++) {
        Country obj;
        cin >> obj;
        c_queue.push(obj);
    }

    cout << "2. Отсортировать его по убыванию элементов." << endl;
    sort_containers_desc(&c_queue);

    cout << "3. Просмотреть контейнер." << endl;
    print_container(c_queue);

    cout << "4. Используя подходящий алгоритм, найти в контейнере элемент, удовлетворяющий заданному условию." << endl;
    find_obj(c_queue);

    cout << "5. Переместить элементы, удовлетворяющие заданному условию в другой (предварительно пустой) контейнер." << endl;
    vector<Country> c_vector;
    move_obj(&c_queue, &c_vector);

    cout << "6. Просмотреть второй контейнер." << endl;
    for (int i = 0; i < c_vector.size(); i++) {
        cout << "Страна №" << i + 1 << "\n-----------" << endl;
        cout << c_vector[i] << endl;
    }
    cout << endl;

    cout << "7. Отсортировать первый и второй контейнеры по возрастанию элементов." << endl;
    sort_containers(&c_queue);
    sort(c_vector.begin(), c_vector.end());

    cout << "8. Просмотреть их." << endl;
    cout << "КОНТЕЙНЕР №1" << endl;
    print_container(c_queue);
    cout << "КОНТЕЙНЕР №2" << endl;
    for (int i = 0; i < c_vector.size(); i++) {
        cout << "Страна №" << i + 1 << "\n-----------" << endl;
        cout << c_vector[i] << endl;
    }
    cout << endl;

    cout << "9. Получить третий контейнер путем слияния первых двух." << endl;
    vector<Country> c_general;
    merge_containers(&c_general, c_queue, c_vector);

    cout << "10. Просмотреть третий контейнер." << endl;
    for (int i = 0; i < c_general.size(); i++) {
        cout << "Страна №" << i + 1 << "\n-----------" << endl;
        cout << c_general[i] << endl;
    }

    cout << "11. Подсчитать, сколько элементов, удовлетворяющих заданному условию, содержит третий контейнер." << endl;
    search_occurrences(c_general);

    cout << "12.Определить, есть ли в третьем контейнере элемент, удовлетворяющий заданному условию." << endl;
    search_obj(c_general);

    return 0;
}

template<typename T>
void print_container(T data) {
    auto buff = data._Get_container();
    for (int i = 0; i < buff.size(); i++) {
        cout << "Страна №" << i + 1 << "\n-----------" << endl;
        cout << buff[i] << endl;
    }

    cout << endl;
}

template<typename T>
void sort_containers(T* data) {
    auto buff = data->_Get_container();

    sort(buff.begin(), buff.end());
    while (data->size() != 0) data->pop();
    for (auto s : buff) data->push(s);
}

template<typename T>
void sort_containers_desc(T* data) {
    auto buff = data->_Get_container();

    sort(buff.begin(), buff.end(), compare);
    while (data->size() != 0) data->pop();
    for (auto s : buff) data->push(s);
}

template<typename T>
void find_obj(T data) {
    auto buff = data._Get_container();
    string search_name = "";
    cout << "Название Станы для поиска: "; cin >> search_name;

    for (auto el : buff) {
        if (el.get_name() == search_name) {
            cout << el << endl;
        }
    }
}

template<typename T1, typename T2>
void move_obj(T1* c1, T2* c2) {
    auto buff_c1 = c1->_Get_container();
    string name = "";
    cout << "Название Станы для перемещения: "; cin >> name;

    for (int i = 0; i < buff_c1.size(); ++i) {
        if (buff_c1[i].get_name() == name) {
            c2->push_back(buff_c1[i]);
            buff_c1.erase(buff_c1.begin() + i);
        }
    }

    while (c1->size() != 0) c1->pop();
    for (auto s : buff_c1) c1->push(s);
}

template<typename T1, typename T2, typename T3>
void merge_containers(T1* gen, T2 c1, T3 c2) {
    auto buff_1 = c1._Get_container();

    for (auto el : buff_1) {
        gen->push_back(el);
    }
    for (auto el : c2) {
        gen->push_back(el);
    }
}

template<typename T>
void search_occurrences(vector<T> gen) {
    string search_name = "";
    cout << "Название Станы для поиска: "; cin >> search_name;
    int count = 0;

    for (auto el : gen) {
        if (el.get_name() == search_name) {
            count++;
        }
    }

    cout << "Всего вхождений по условию: " << count << endl;
}

template<typename T>
void search_obj(vector<T> gen) {
    string search_name = "";
    cout << "Название Станы для поиска: "; cin >> search_name;

    for (auto el : gen) {
        if (el.get_name() == search_name) {
            cout << "Объект найден." << endl;
            return;
        }
    }

    cout << "Вхождений не найденою" << endl;
}
