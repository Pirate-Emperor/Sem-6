#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main() {
    const int np = 100000;
    int i, count = 0;
    double x, y;

    srand(42);

    #pragma omp parallel for private(x, y) reduction(+:count)
    for (i = 0; i < np; ++i) {
        x = (double)rand() / RAND_MAX;
        y = (double)rand() / RAND_MAX;
        if (x*x + y*y <= 1.0) {
            count++;
        }
    }

    double q = (double)count / np;
    double estimated_pi = 4 * q;
    double actual_pi = 3.1415926535;
    double error_pi = actual_pi - estimated_pi;
    
    printf("Actual value of pi: %.10f\n", actual_pi);
    printf("Estimation of π using Monte Carlo method: %.10f\n", estimated_pi);
    printf("Error in the estimation of the value of pi: %.10f\n",error_pi);
    return 0;
}
