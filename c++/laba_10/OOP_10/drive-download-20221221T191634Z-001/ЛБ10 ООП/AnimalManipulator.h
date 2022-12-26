#pragma once
#ifndef ANIMALMANIPULATOR_H_
#define ANIMALMANIPULATOR_H_

#include <fstream>
#include <iostream>

class AnimalManipulator
{
public:
	AnimalManipulator();
	std::ostream& (*f) (std::ostream&, int);
	int i;
	AnimalManipulator(std::ostream& (*ff) (std::ostream&, int), int ii);
	
	friend std::ostream& SetLine(std::ostream& out, char c, unsigned int amount);
};
#endif // ANIMALMANIPULATOR_H_