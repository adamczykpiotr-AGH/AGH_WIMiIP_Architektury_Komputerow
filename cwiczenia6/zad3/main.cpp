#include <iostream>


extern "C"
int maxval (int *a, int b);

int main(){

	const int size = 500;

	int tab[size];
	int i;
	int max = 0;
	for(i=0; i < size; i++){
		tab[i] = i*5;
	}

	for(i=0; i<size; i++){
		if(tab[i]>max){
			max = tab[i];
		}	
	}		

	std::cout << "Najwieksza wartosc w tablicy to: " << maxval(tab, size) << ".\n";
	if (maxval(tab, size) == max){
		std::cout << "Wynik obliczen jest poprawny.\n";
	} else {
		std::cout << "Wynik obliczen NIE jest poprawny.\n";	
	}
	return 0;

}
