#include <iostream>

extern "C" void sort(char *a, int b);

using namespace std;

int main(){

	const int size = 3;
	char tab [size];

	tab[0]='a';
	tab[1]='x';
	tab[2]='d';

	cout<< "Przed:" << endl;

	for (int i=0;i<size;i++){
		cout << tab[i] << ", ";
	}
	cout << endl << endl;

	
	sort(tab,size);

	cout<< "Po:" << endl;

	for (int i=0;i<size;i++){
		cout << tab[i] << ", ";
	}





	return 0;
}
