#include <iostream>
#include <stdlib.h>
#include <time.h>

extern "C"
void zamien (int *a, int b);


int main(){


	const int size = 10;
	int tab[size];

 	srand (time(NULL));

	for(int i=0;i<size;i++){
		tab[i] = rand() % 10; 
	}
	
	std::cout<<"Tablica przed zmiana: ";

	for(int i=0;i<size;i++){
		std::cout<<tab[i]<<", ";
		if(i==size-1){
			std::cout<<tab[i];
		}
	}
	std::cout<<"\n";

	zamien(tab,size);

	std::cout<<"Wynik: 		      ";

	for(int i=0;i<size;i++){
		std::cout<<tab[i]<<", ";
		if(i==size-1){
			std::cout<<tab[i];
		}
	}

	std::cout<<"\n";

	return 0;

}
