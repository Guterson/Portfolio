#include "combinacao.h"

int Fatorial( int n ){ // Recursive factorial
	if( n == 1)
		return 1;
	else
		return n*Fatorial( n - 1);
}

int Combinacao( int n, m ){ // Combination
	return ( Fatorial( n ) / ( ( Fatorial( m ) )*( Fatorial( n - m ) ) ) ); 
}