#include <iostream>
using namespace std;
extern "C" int mnozenie (int a, int b);

int main(){

	int a,b;

	std::cout << "Podaj pierwsza liczbe: ";
	std::cin >> a;	
	std::cout << "Podaj druga liczbe: ";
	std::cin >> b;

	std::cout << "Wynik: " << mnozenie(a,b) << ".\n";


	return 0;

}
