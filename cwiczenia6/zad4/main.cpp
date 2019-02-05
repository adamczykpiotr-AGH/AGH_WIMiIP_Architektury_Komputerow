#include <iostream>

extern "C"
void litera (char *a, int b);


int main(){

	const int size = 5000;
	char tab[size];

	for(int i=0;i<size;i++){
		tab[i]=0;
	}


	std::cout<<"Podaj string: ";
	std::cin>>tab;
	
	litera(tab,size);

	std::cout<<"Wynik: ";

	for(int i=0;i<size;i++){
		std::cout<<tab[i];
	}

	std::cout<<"\n";


	return 0;

}
