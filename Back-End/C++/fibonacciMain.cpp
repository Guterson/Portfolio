#include <iostream>
#include "fibonacci.h"

using namespace std;

int main(){
	int n;
	cout << "Type the number order: " << endl;
	cin >> n;
	cout << "The number of order " << n << " is: " << Fibonacci( n ) << endl;
}