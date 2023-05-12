#include <iostream>

template<typename T>
class SmartPointer
{
public:
    SmartPointer(T* ptr)
    {
        this->ptr = ptr;
        std::cout << "CONSTRUCTOR" << std::endl;
    }

    ~SmartPointer()
    {
        delete ptr;
        std::cout << "DESTRUCTOR" << std::endl;
    }

    T& operator*()
    {
        return *ptr;
    }

private:
    T* ptr;
};


int main()
{
    SmartPointer<int> pointer = new int(333);
    *pointer = 2023;
    std::cout << *pointer << std::endl;

    return 0;
}
