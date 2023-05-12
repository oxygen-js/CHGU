#pragma once
#ifndef _TAXI_H_
#define _TAXI_H_

#include <string>

class TaxiClass
{
public:
    int number = 0;
    bool on_call = false;
    std::string brand = "";
    std::string driver = "";
    std::string address = "";
    TaxiClass(int number, std::string brand, std::string driver, std::string address, bool on_call);
};

#endif // !_TAXI_H_
