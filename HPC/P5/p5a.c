#include <omp.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>

#define T 5
#define N 10

int row[N];
int col[N];
int dig[2*N];
int dig2[2*N];
char board[N][N];
int Qcnt = 0;
int Bcnt = 0;
bool check(int i, int j)
{
	if (row[i]==1 || col[j]==1 || dig[N+i-j]==1 || dig2[i+j]==1) return false;
	else return true;
}
void display_Board()
{
	#pragma omp critical
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
}
void NQueen(int j)
{
	if (Qcnt==N)
	{
		//display_Board();
		Bcnt++;
	}
	for (int i=0;i<N;i++)
	{
		if (check(i,j))
		{
			board[i][j] = 'Q';
			row[i]=1;
			col[j]=1;
			dig[N+i-j]=1;
			dig2[i+j]=1;
			Qcnt++;
			NQueen(j+1);
			board[i][j] = '.';
			row[i]=0;
			col[j]=0;
			dig[N+i-j]=0;
			dig2[i+j]=0;
			Qcnt--;
		}
	}
	return;
}
void NQueen_Parallel(int j)
{
	if (Qcnt==N)
	{
		display_Board();
		Bcnt++;
	}
	#pragma omp parallel for
	for (int i=0;i<N;i++)
	{
		if (check(i,j))
		{
			#pragma omp critical
			{
				board[i][j] = 'Q';
				row[i]=1;
				col[j]=1;
				dig[N+i-j]=1;
				dig2[i+j]=1;
				Qcnt++;
			}
			NQueen_Parallel(j+1);
			#pragma omp critical
			{
				board[i][j] = '.';
				row[i]=0;
				col[j]=0;
				dig[N+i-j]=0;
				dig2[i+j]=0;
				Qcnt--;
			}
		}
	}
	return;
}
int main() {
	for (int i=0;i<N;i++){
		row[i]=0;
		col[i]=0;
		dig[i]=0;
		dig[N+i]=0;
		dig2[i]=0;
		dig2[N+i]=0;
	}
	for (int i=0;i<N;i++) for (int j=0;j<N;j++) board[i][j]='.';
	clock_t start_serial = clock();
    	NQueen(0);
    	clock_t end_serial = clock();
    	int serial_count = Bcnt;
    	Bcnt=0;
    	double serial_time = ((double)end_serial - start_serial) / CLOCKS_PER_SEC;
    	for (int i=0;i<N;i++) for (int j=0;j<N;j++) board[i][j]='.';
    	clock_t start_parallel = clock();
    	#pragma omp parallel
    	{
    		#pragma omp single
	    	{
	    		NQueen_Parallel(0);
	    	}
	}
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

