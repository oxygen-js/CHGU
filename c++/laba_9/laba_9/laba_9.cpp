#include <iostream>
#include <math.h>

using namespace std;

class ZeroDivideException
{
public:
    int idx;
    ZeroDivideException(int in_idx)
    {
        idx = in_idx;
    }
};

class SqrtException
{
public:
    int idx;
    SqrtException(int in_idx)
    {
        idx = in_idx;
    }
};

class IndexException
{
public:
    int idx;
    IndexException(int in_i)
    {
        idx = in_i;
    }
};

void set_value_a(double val, int i, int n, double* arr)
{
    if (val == 0.0)
    {
        arr[i] = 0.0;
        throw ZeroDivideException(i);
    }
    if (val < 0)
    {
        arr[i] = 0.0;
        throw SqrtException(i);
    }
    if (i >= n)
    {
        throw IndexException(i);
    }

    arr[i] = log(pow((1 - val), 3));
};

void set_value_c(double val, int i, int n, double *arr)
{
    if (val == 0.0)
    {
        arr[i] = 0.0;
        throw ZeroDivideException(i);
    }
    if (val < 0)
    {
        arr[i] = 0.0;
        throw SqrtException(i);
    }
    if (i >= n)
    {
        throw IndexException(i);
    }

    arr[i] = val;
}

void Print(int i, int n, double* arr)
{
    if (i >= n)
    {
        throw IndexException(i);
    }
    cout << arr[i] << endl;
}

int main()
{
    int len_a = 20;
    int len_b = 25;
    int len_c = 30;
    double* a = new double[len_a];
    double* b = new double[len_b];
    double* c = new double[len_c];
    double x = -3.0;

    for (int i = 0; x <= 3; i++, x += 0.3)
    {
        try
        {
            set_value_a(x, i, len_a, a);
        }
        catch (ZeroDivideException ex)
        {
            cout << "Zero divide error in index" << ex.idx << endl;
        }
        catch (SqrtException ex)
        {
            cout << "Sqrt error in index" << ex.idx << endl;
        }
        catch (IndexException ex)
        {
            cout << "Index out of range in index" << ex.idx << endl;
        }
    }

    for (int i = 0; i < len_b; i++)
        b[i] = -1 + rand() % 5;

    for (int i = 0; i <= len_c; i++)
    {
        try
        {
            double val = sqrt(a[i] - b[i]);
            set_value_c(val, i, len_c, c);
        }
        catch (ZeroDivideException ex)
        {
            cout << "Zero divide error in index" << ex.idx << endl;
        }
        catch (SqrtException ex)
        {
            cout << "Sqrt error in index" << ex.idx << endl;
        }
        catch (IndexException ex)
        {
            cout << "Index out of range in index" << ex.idx << endl;
        }
    }
    

    cout << "PRINT A: " << endl;
    for (int i = 0; i < len_a; i++)
    {
        try
        {
            Print(i, len_a, a);
        }
        catch (IndexException ex)
        {
            cout << "Index out of range in index" << ex.idx << endl;
        }
    }
    cout << endl << endl << endl;

    cout << "PRINT B: " << endl;
    for (int i = 0; i < len_b; i++)
    {
        try
        {
            Print(i, len_b, b);
        }
        catch (IndexException ex)
        {
            cout << "Index out of range in index" << ex.idx << endl;
        }
    }
    cout << endl << endl << endl;

    cout << "PRINT C: " << endl;
    for (int i = 0; i < len_c; i++)
    {
        try
        {
            Print(i, len_c, c);
        }
        catch (IndexException ex)
        {
            cout << "Index out of range in index" << ex.idx << endl;
        }
    }
    cout << endl << endl << endl;

    delete[]a;
    delete[]b;
    delete[]c;
}
