#include <omp.h>
#include <stdio.h>

#define T 4
#define N 50
#define M 20

int main() {
    int i;
    int array[N];
    for (i=0;i<N;i++) array[i]=i;
    // Schedule Clause
    #pragma omp parallel for num_threads(T) schedule(static, 10)
    for (i=0;i<N;i++) printf("Thread %d handles element %d with value %d\n", omp_get_thread_num(), i, array[i]);
    // Section Clause 
    #pragma omp parallel sections num_threads(T)
    {
        #pragma omp section
        {
		for (int j=0;j<M;j++)
		{
		    printf("Thread %d executes section 1.%d\n", omp_get_thread_num(), j);
            	}
        }
        #pragma omp section
        {
		for (int j=0;j<M;j++)
		{
		    printf("Thread %d executes section 2.%d\n", omp_get_thread_num(), j);
            	}
        }
    }

    // Synchronization Clause
    #pragma omp parallel num_threads(T)
    {
        #pragma omp critical
        {
            printf("Thread %d enters critical section\n", omp_get_thread_num());
            
            printf("Thread %d exits critical section\n", omp_get_thread_num());
        }
        #pragma omp barrier 
        printf("Thread %d continues after barrier\n", omp_get_thread_num());
    }

    return 0;
}

