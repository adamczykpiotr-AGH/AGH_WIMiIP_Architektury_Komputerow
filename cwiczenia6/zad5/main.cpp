#include <iostream>

extern "C"
int binary(int a);

int main(){

	int liczba;
	
	std::cout<<"Podaj liczbe w systemie dziesietnym: ";
	std::cin>>liczba;

	std::cout<<"Ilość jedynek w liczbie w systemie binarnym: " << binary(liczba) << ".\n";	

	return 0;
}
