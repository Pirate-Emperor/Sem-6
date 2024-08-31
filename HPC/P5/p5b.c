#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <omp.h>

#define T 5
#define N 5


int Bcnt = 0;
char board[N][N];

void display_Board()
{
	printf("Board Id: %d\n",Bcnt);
	for (int i=0;i<N;i++)
	{
		for (int j=0;j<N;j++)
		{
			printf("%c ", board[i][j]);
		}
		printf("\n");
	}
}

void KHorse() {
	if (N==1) {
		board[0][0]='K';
		display_Board();
		Bcnt++;
		return;
	}
	for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) if (j%2==0) board[i][j] = 'K';
	display_Board();
	Bcnt++;
	for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) board[i][j*2] = '.';
	for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) if (j%2==1) board[i][j] = 'K';
	display_Board();
	Bcnt++;
	return;
}

void KHorse_Parallel() {
	if (N==1) {
		board[0][0]='K';
		display_Board();
		Bcnt++;
		return;
	}
	#pragma parallel for
	for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) if (j%2==0) board[i][j] = 'K';
	display_Board();
	Bcnt++;
	#pragma parallel for
	for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) board[i][j*2] = '.';
	#pragma parallel for
	for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) if (j%2==1) board[i][j] = 'K';
	display_Board();
	Bcnt++;
	return;
}

int main() {
    	for (int i=0;i<N;i++)
	{
		for (int j=0;j<N;j++)
		{
			board[i][j]='.';
		}
	}
	clock_t start_serial = clock();
    	KHorse();
    	clock_t end_serial = clock();
    	int serial_count = Bcnt;
    	Bcnt=0;
    	double serial_time = ((double)end_serial - start_serial) / CLOCKS_PER_SEC;
    	clock_t start_parallel = clock();
    	KHorse_Parallel();
    	clock_t end_parallel = clock();
    	int parallel_count = Bcnt;
    	double parallel_time = ((double)end_parallel - start_parallel) / CLOCKS_PER_SEC;
    	printf("Serial board count: %d\n", serial_count);
    	printf("Parallel board count: %d\n", parallel_count);
    	printf("Serial execution time: %f seconds\n", serial_time);
    	printf("Parallel execution time: %f seconds\n", parallel_time);
    	double scale_factor = serial_time/parallel_time;
    	printf("Serial-to-Parallel Time Ratio: %.2f\n",scale_factor);
	return 0;
}

	
