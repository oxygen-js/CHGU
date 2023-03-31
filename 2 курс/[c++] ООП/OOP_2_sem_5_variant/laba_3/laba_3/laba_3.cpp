#include <iostream>
#include <string>

bool check_valid_str(std::string str)
{
	size_t start = 0;
	for (int i = 0; i < 9; i++)
	{
		start = str.find(std::to_string(i));
	}
	 
	return start == std::string::npos;
}

int main()
{
	setlocale(LC_ALL, "Russian");
	/*
		std::string del = "abc";
		std::string offer = "saabcbcdabc saabcbcdabc saabcb 1234cd abc  4saabc 341234213 12bcdabc dfhsadf khsadkfg asdkgqwie gwqief wefnASDAVDSFVASJDBF";
	*/
	std::string del_str = "";
	std::string offer = "";

	std::cout << "Введите строку: " << std::endl;
	std::cin >> offer;
	std::cout << "Введите строку для УДАЛЕНИЯ: " << std::endl;
	std::cin >> del_str;


	if (!check_valid_str(offer)) 
	{
		std::cout << "Строка состоит только из цифр или перевертышей. Введите корректную строку" << std::endl;
		return -1;
	}

	size_t start = offer.find(del_str);
	while (start != std::string::npos)
	{
		offer.erase(start, del_str.length());
		start = offer.find(del_str);
	}

	std::cout << "Резуальтат: " << offer << std::endl;

	return 0;
}
