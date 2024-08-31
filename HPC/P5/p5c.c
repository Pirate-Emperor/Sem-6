#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

#define T 16
#define N 4

static int Bcnt = 0;
const int rowMove[] = {-2, -2, -1, -1, 1, 1, 2, 2};
const int colMove[] = {-1, 1, -2, 2, -2, 2, -1, 1};
void makeBoard(char** board) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            board[i][j] = '_';
        }
    }
}

void displayBoard(char** board) {
    printf("Board Id: %d\n",Bcnt);
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (board[i][j]=='_' || board[i][j]=='A') printf(" . ");
            else printf(" %c ", board[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void attack(int row, int col, char a, char** board) {
	for (int k = 0; k < 8; k++) {
		int nextRow = row + rowMove[k];
		int nextCol = col + colMove[k];
		if (nextRow >= 0 && nextRow < N && nextCol >= 0 && nextCol < N) board[nextRow][nextCol] = a;
	}
}

int canPlace(int i, int j, char** board) {
    if (board[i][j] == '_') return 1;
    else return 0;
}

void place(int i, int j, char k, char a, char** board, char** new_board) {
    for (int y = 0; y < N; y++) for (int z = 0; z < N; z++) new_board[y][z] = board[y][z];
    new_board[i][j] = k;
    attack(i, j, a, new_board);
}

void kkn(int k, int sti, int stj, char** board) {
    if (k == 0) {
        displayBoard(board);
        Bcnt++;
    } else {
        for (int i = sti; i < N; i++) {
            for (int j = stj; j < N; j++) {
                if (canPlace(i, j, board)) {
                    char** new_board = (char**)malloc(N * sizeof(char*));
                    for (int x = 0; x < N; x++) {
                        new_board[x] = (char*)malloc(N * sizeof(char));
                    }
                    place(i, j, 'K', 'A', board, new_board);
                    kkn(k - 1, i, j, new_board);
                    for (int x = 0; x < N; x++) free(new_board[x]);
                    free(new_board);
                }
            }
            stj = 0;
        }
    }
}
void kkn_parallel(int k, int sti, int stj, char** board) {
    if (k == 0) {
        //displayBoard(board);
        Bcnt++;
    } else {
        for (int i = sti; i < N; i++) {
            for (int j = stj; j < N; j++) {
                if (canPlace(i, j, board)) {
                    char** new_board = (char**)malloc(N * sizeof(char*));
                    for (int x = 0; x < N; x++) {
                        new_board[x] = (char*)malloc(N * sizeof(char));
                    }
                    place(i, j, 'K', 'A', board, new_board);
                    kkn_parallel(k - 1, i, j, new_board);
                    for (int x = 0; x < N; x++) {
                        free(new_board[x]);
                    }
                    free(new_board);
                }
            }
            stj = 0;
        }
    }
}

int main() {
    	char** board = (char**)malloc(N * sizeof(char*));
	for (int i = 0; i < N; i++) {
		board[i] = (char*)malloc(N * sizeof(char));
	}
    	makeBoard(board);
    	clock_t start_serial = clock();
    	for (int i=1;i<=N*N;i++){
		kkn(i, 0, 0, board);
		makeBoard(board);
	}
	clock_t end_serial = clock();
	int serial_count = Bcnt;
	Bcnt = 0;
	double serial_time = ((double)end_serial - start_serial) / CLOCKS_PER_SEC;
	makeBoard(board);
	clock_t start_parallel = clock();
	#pragma omp parallel num_threads(T) 
	{
		#pragma omp for schedule(dynamic) 
		for (int i=1;i<=N*N;i++){
			// #pragma omp parallel
	    		{
		    		// #pragma omp task
			    	{
					kkn_parallel(i, 0, 0, board);
					makeBoard(board);
				}
			}
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
    
    	for (int i = 0; i < N; i++) free(board[i]);
    	free(board);
    	return 0;
}

