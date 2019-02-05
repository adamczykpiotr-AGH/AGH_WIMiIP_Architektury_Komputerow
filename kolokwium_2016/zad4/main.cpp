#include <iostream>

extern "C" int dziel (int a, int b);
using namespace std;

int main(){

	int liczba1, liczba2;
	cout << "Podaj pierwsza liczbe: ";
	cin >> liczba1;
	cout << "Podaj druga liczbe: ";
	cin >> liczba2;
	
	cout << "Reszta z dzielenia wynosi: " << dziel(liczba1, liczba2) << "\n";


	return 0;
}
