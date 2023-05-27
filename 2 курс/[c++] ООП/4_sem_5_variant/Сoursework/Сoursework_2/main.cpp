
#include <iostream>
#include <string>
#include <queue>
#include <vector>

template<typename T>
void print_container(std::queue<T> data);

template<typename T>
void replace(std::queue<T>* data);

template<typename T>
void remove_to_paste(std::queue<T>* data, std::vector<T> vec);

class Country {
public:
    Country() {}
    Country(std::string in_name, std::string in_form_government, float in_area) {
        this->set_name(in_name);
        this->set_area(in_area);
        this->set_form_government(in_form_government);
    }
    float  get_area() const { return area; }
    std::string get_name() const { return name; }
    std::string get_form_government() const { return form_government; }


    void set_name(std::string in_name) { name = in_name; }
    void set_area(float in_area) { area = in_area; }
    void set_form_government(std::string in_form_government) { form_government = in_form_government; }

    friend std::ostream& operator << (std::ostream& os, const Country& obj) {
        return os << "Название: " << obj.get_name() << "\nФорма правления: " << obj.get_form_government() << "\nПлощадь: " << obj.get_area() << std::endl;
    }

    friend std::istream& operator >> (std::istream& in, Country& obj) {
        float in_area;
        std::string in_name;
        std::string in_form_government;
        std::cout << "Название: "; in >> in_name;
        std::cout << "Форма правления: "; in >> in_form_government;
        std::cout << "Площадь: "; in >> in_area;
        std::cout << std::endl;

        if (in) {
            obj.set_name(in_name);
            obj.set_area(in_area);
            obj.set_form_government(in_form_government);
        }

        return in;
    }

private:
    std::string name = "Not defined";
    std::string form_government = "Not defined";
    float area = 1;
};


int main()
{
    setlocale(LC_ALL, "Russian");
    int size = 1;
    std::cout << "1. Создать объект-контейнер и заполнить его данными." << std::endl;
    std::cout << "Количество объектов: "; std::cin >> size;
    std::queue<Country> que;
    for (int i = 0; i < size; i++) {
        Country obj;
        std::cin >> obj;
        que.push(obj);
    }

    std::cout << "2. Просмотреть контейнер." << std::endl;
    print_container(que);

    std::cout << "3. Изменить контейнер, удалив из него одни элементы и заменив другие." << std::endl;
    replace(&que);

    std::cout << "4. Просмотреть контейнер, используя для доступа к его элементам итераторы." << std::endl;
    print_container(que);

    std::cout << "5. Создать второй контейнер этого же класса и заполнить его данными того же типа, что и первый контейнер." << std::endl;
    std::vector<Country> vec;
    int size_vec = 1;
    std::cout << "Количество объектов: "; std::cin >> size_vec;
    for (int i = 0; i < size_vec; i++) {
        Country obj;
        std::cin >> obj;
        vec.push_back(obj);
    }

    std::cout << "6. Изменить первый контейнер, удалив из него n элементов после заданного и добавив затем в него все элементы из второго контейнера." << std::endl;
    remove_to_paste(&que, vec);

    std::cout << "7. Просмотреть первый и второй контейнеры." << std::endl;
    std::cout << "КОНТЕЙНЕР №1" << std::endl;
    print_container(que);

    std::cout << "КОНТЕЙНЕР №2" << std::endl;
    for (int i = 0; i < vec.size(); i++) {
        std::cout << "Страна №" << i + 1 << "\n-----------" << std::endl;
        std::cout << vec[i] << std::endl;
    }
    

    return 0;
}


template<typename T>
void print_container(std::queue<T> data) {
    auto buff = data._Get_container();
    for (int i = 0; i < buff.size(); i++) {
        std::cout << "Страна №" << i + 1 << "\n-----------" << std::endl;
        std::cout << buff[i] << std::endl;
    }

    std::cout << std::endl;
}

template<typename T>
void replace(std::queue<T>* data) {
    auto buff = data->_Get_container();
    std::deque<Country>::iterator it = buff.begin();

    std::cout << "СПИСОК: " << std::endl;
    for (auto el : buff) {
        std::cout << el << std::endl;
    }

    std::string replace_name = "";
    std::cout << "Введите название страны для замены: "; std::cin >> replace_name;

    Country obj;
    std::cin >> obj;

    for (int i = 0; i < buff.size(); i++) {
        if (buff[i].get_name() == replace_name) {
            buff.erase(it + i);
            buff.insert(buff.begin() + i, obj);
            break;
        }
    }

    while (data->size() != 0) data->pop();
    for (auto s : buff) data->push(s);
}

template<typename T>
void remove_to_paste(std::queue<T>* data, std::vector<T> vec) {
    auto buff = data->_Get_container();
    std::deque<Country>::iterator it = buff.begin();

    int rem_idx = 0;
    int rem_count = 0;
    std::cout << "Индекс: "; std::cin >> rem_idx;
    std::cout << "Количество элементов: "; std::cin >> rem_count;

    buff.erase(it + rem_idx, it + rem_count);
    for (int i = 0; i < vec.size(); i++) {
        buff.insert(buff.begin() + rem_idx + i, vec[i]);
    }
    

    while (data->size() != 0) data->pop();
    for (auto s : buff) data->push(s);
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

Методические указ
*/