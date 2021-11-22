#include <iomanip>
#include <bits/stdc++.h>

#include "Approximation_Function.h"
#include "Exact_Function.h"

using namespace std;


// Print Values
void print_values(double t, double y, double exact_func, float error, int n){
    printf("%d      %f    %f    %f    %f \n", n, t, y, exact_func, error);
}


double Euler_Method_Differential_Equations(double h, double y, double t, double x, int n, int i=0){

    double approx_func, exact_func, error;
    for(int i=0; i<=n; i++){
        approx_func = approximation_function(t, y);
        exact_func = exact_function(t);

        // We use this error calculation method to find the error percentage 
        // between the approximation function and the exact function
        error = (std::abs(exact_func - y) / exact_func ) * 100.0;
        
        print_values(t, y, exact_func, error, i);

        y = y + (h*approx_func);
        t = t + h;
    }
    return y;
}


// Main program 
int main(void){

    double h = 0.1, y = 1.0, t = 0.0, x = 1.0;
    int n = (x / (t+h))+1;

    cout << Euler_Method_Differential_Equations(h, y, t, x, n);

    return 0;
}