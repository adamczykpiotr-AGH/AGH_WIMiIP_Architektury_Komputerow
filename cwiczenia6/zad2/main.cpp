#include <iostream>

extern "C" int cyfry(int a);

int main(){

	int a;

	std::cout << "Podaj liczbe: ";
	std::cin >> a;
	std::cout << "Liczba cyfr w podanej liczbie to: " << cyfry(a) << ".\n";

	return 0;
}
