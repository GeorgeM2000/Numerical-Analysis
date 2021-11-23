#include <bits/stdc++.h>
#include "Approximation_Function.h"
#include "Exact_Function.h"

using namespace std;



// Print Values
void print_values(double t, double y, double exact_func, float error, int n){
    printf("%d      %f    %f    %f    %f \n", n, t, y, exact_func, error);
}

double Runge_Kutta(double h, double y, double t, double x, int n, double exact_func) {

    double approx_k1, approx_k2, approx_k3, error;
    for(int i=0; i<=n; i++){

        error = std::abs(y - exact_func);

        print_values(t, y, exact_func, error, i);

        approx_k1 = h * approximation_function(t, y);
        approx_k2 = h * approximation_function(t + (h/2.0), y + (approx_k1/2.0));
        approx_k3 = h * approximation_function(t + h, y - approx_k1 + 2.0*approx_k2);
        
        t = t + h;
        exact_func = exact_function(t);
        y = y + ((approx_k1 + 4.0*approx_k2 + approx_k3)/6.0);
    }

    return y;

}

int main() {
    double h = 0.2, y = 2.0, t = 0.0, x = 1.0;
    int n = (x / (t+h)) + 1;

    cout << Runge_Kutta(h, y, t, x, n, y);
    return 0;
}