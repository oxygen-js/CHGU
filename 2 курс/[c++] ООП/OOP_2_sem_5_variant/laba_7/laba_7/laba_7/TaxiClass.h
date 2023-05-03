#pragma once
#ifndef _TAXI_H_
#define _TAXI_H_

#include <string>

class TaxiClass
{
	
public:
    int number;
    std::string stamp;
    std::string driver;
    std::string address;
    bool on_call;
    TaxiClass(int number, std::string stamp, std::string driver, std::string address, bool on_call);
};

#endif // !_TAXI_H_
