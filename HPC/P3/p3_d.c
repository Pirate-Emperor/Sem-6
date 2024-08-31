#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

#define NP 100000

int main() {
    int i, count = 0;
    double x, y, z;

    // Serial Estimation
    clock_t start_serial = clock();
    for (i = 0; i < NP; ++i) {
        x = (double)rand() / RAND_MAX;
        y = (double)rand() / RAND_MAX;
        z = x * x + y * y;
        if (z <= 1) count++;
    }

    double pi_serial = (double)count / NP * 4;
    double actual_pi = 3.1415926535;
    double error_serial_pi = actual_pi - pi_serial;
    
    
    clock_t end_serial = clock();
    printf("Serial estimate of pi: %f\n", pi_serial);
    printf("Error in the estimation of the value of pi : %f\n",error_serial_pi);
    printf("Serial execution time: %f seconds\n", ((double)end_serial - start_serial) / CLOCKS_PER_SEC);

    // Parallel Estimation
    count = 0;
    double pi_parallel;
    clock_t start_parallel = clock();
    #pragma omp parallel for private(x, y, z) reduction(+:count)
    for (i = 0; i < NP; ++i) {
        x = (double)rand() / RAND_MAX;
        y = (double)rand() / RAND_MAX;
        z = x * x + y * y;
        if (z <= 1) count++;
    }

    pi_parallel = (double)count / NP * 4;
    double error_parallel_pi = actual_pi - pi_parallel;
    clock_t end_parallel = clock();
    printf("Parallel estimate of pi: %f\n", pi_parallel);
    printf("Error in the estimation of the value of pi : %f\n",error_parallel_pi);
    printf("Parallel execution time: %f seconds\n", ((double)end_parallel - start_parallel) / CLOCKS_PER_SEC);

    return 0;
}
