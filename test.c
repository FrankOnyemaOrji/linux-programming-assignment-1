#include <stdio.h>

// Author: Frank Onyema Orji

double add(double a, double b);
double subtract(double a, double b);
double multiply(double a, double b);
double divide(double a, double b);

int main() {
    double a = 10.0;
    double b = 5.0;
    
    printf("Add: %f\n", add(a, b));
    printf("Subtract: %f\n", subtract(a, b));
    printf("Multiply: %f\n", multiply(a, b));
    printf("Divide: %f\n", divide(a, b));

    return 0;
}
