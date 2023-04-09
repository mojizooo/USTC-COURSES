#include <stdio.h>
#include <time.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;
int main(){
	scanf("%hd %hd", &R0, &R1);
	struct timeval start;
    struct timeval end;
    unsigned long timer;
    mingw_gettimeofday(&start, NULL);
	while(R1){
		R7 += R0;
		R1--;
	}
	printf("%hd\n", R7);
	mingw_gettimeofday(&end, NULL);
	timer = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
    printf("timer = %ld us\n", timer);
	return 0; 
}