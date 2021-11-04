#include <iostream>
#include "combinacao.h"

using namespace std;

int main(){
	int n, m;
	cout << "How many elements?" << endl;
	cin >> n;
	cout << "How many elements per group?" << endl; 
	cin >> m;
	cout << "Total of combinations: " << Combinacao( n, m ) << endl;
}