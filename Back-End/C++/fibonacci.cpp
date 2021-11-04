#include "fibonacci.h"

int Fibonacci( int n ){ // Recursive Fibonacci sequence
	int f = ( ( n == 0 ) || ( n == 1 ) ) ? 1 : ( Fibonacci( n - 1 ) + Fibonacci( n - 2 ) );
	return f;
};
	