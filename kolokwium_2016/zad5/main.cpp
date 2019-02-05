#include <iostream>
#include <iomanip>

using namespace std;
extern "C" int fun (int a, int *b);

void funcpp(int rozmiar, int *tab){

	for(int i=0; i<100000; ++i){

		for (int j=0; j<rozmiar; ++j){
			tab[j] = tab[j] + 2;	
		}
	}
}


int main(){

	double	start_t1, end_t1, diff_t1,
		start_t2, end_t2, diff_t2;

	const int size = 9000;
	int tab[size];
	for (int i=0; i<size; i++){
		tab[i] = i*1;	
	}



	//funcjkcja CPP

	start_t1 = clock();

	funcpp(size, tab);

	end_t1 = clock();
	diff_t1 = (end_t1 - start_t1) / (double) CLOCKS_PER_SEC;

	cout << "Czas CPP: " << setprecision(20) << diff_t1 << "\n";


	//funkcja ASM
	start_t2 = clock();

	
	fun(size, tab);

	end_t2 = clock();
	diff_t2 = (end_t2 - start_t2) / (double) CLOCKS_PER_SEC;

	cout << "Czas ASM: " << setprecision(20) << diff_t2 << "\n";
	cout << "Delta  T: " << setprecision(20) << diff_t1-diff_t2 << "\n";



	return 0;
}
