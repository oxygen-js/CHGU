#include "TaxiClass.h"

TaxiClass::TaxiClass(int number, std::string brand, std::string driver, std::string address, bool on_call) {
	TaxiClass::number = number;
	TaxiClass::brand = brand;
	TaxiClass::driver = driver;
	TaxiClass::address = address;
	TaxiClass::on_call = on_call;
}