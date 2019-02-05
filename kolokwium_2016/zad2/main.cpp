#include <iostream>
#include <stdlib.h>
#include <time.h>

extern "C"
int maxval (int *a, int b, int *c);


int main(){

	const int size = 20;
	int tab[size];

	int outp[1];
	outp[0]=0;

	for(int i=0; i<size; i++){
		tab[i] = i+20;
	}


	std::cout<<", wartosc maksymalna to: " << maxval(tab, size, outp) << "\n"; 
	std::cout << outp[0];
	
	


	return 0;
}
