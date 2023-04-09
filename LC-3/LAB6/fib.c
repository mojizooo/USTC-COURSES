#include <stdio.h>
#include <time.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;
int main(){
	scanf("%hd", &R0);
	R1 += 1;
	R2 += 1;
	R3 += 2;
	R7 = R0;
	if(R0 < 3){
		printf("%hd\n", R7);
		return 0;
	}
	else while(R0 >= 3){
		R7 = R3;
		R7 += R1;
		R7 += R1;
		R7 &= 1023;
		R1 = R2;
		R2 = R3;
		R3 = R7;
		R0--;
	}
	printf("%hd\n", R7);
	return 0;
}