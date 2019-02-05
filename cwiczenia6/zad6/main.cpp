#include <iostream>

extern "C"
int trojkat (int a, int b, int c);

int main(){

	int a,b,c;

	std::cout<<"Podaj rozmiar pierwszego boku: ";
	std::cin>>a;
	std::cout<<"Podaj rozmiar drugiego boku: ";
	std::cin>>b;
	std::cout<<"Podaj rozmiar trzeciego boku: ";
	std::cin>>c;


	if(trojkat(a,b,c)==true){
		std::cout << "\nTAK\n";	
	} else {
		std::cout << "\nNIE\n";	
	}


	
	return 0;
}
