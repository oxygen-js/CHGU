#pragma once
#ifndef _TAXI_H_
#define _TAXI_H_

#include <string>

class TaxiClass
{
	
public:
    int number;
    std::string brand;
    std::string driver;
    std::string address;
    bool on_call;
    TaxiClass() {};
    TaxiClass(int number, std::string brand, std::string driver, std::string address, bool on_call) {
        this->number = number;
        this->brand = brand;
        this->driver = driver;
        this->address = address;
    }

};

#endif // !_TAXI_H_
