#include <iostream>
#include <cmath>
using namespace std;

// Factorial Function
int Factorial(int x){
	if(x == 1){
		return 1;
	}
	return x * Factorial(x-1);
}

// Taylor Series Function
double Taylor(double x, int n, double& approx){
	for(int i=1; i<n; i++){
		approx += pow(x, i) / double(Factorial(i));
	}

	return approx;

}

// Main Program
int main(void){
	double approximation = 1.0;
	cout << Taylor(4.0, 15, approximation);	

	return 0;
}
