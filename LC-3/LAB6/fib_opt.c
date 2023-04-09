#include <stdio.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;
int main(){
	scanf("%hd", &R0);
	R7 = R0;
	R0 -= 2;
	if(R0 <= 0){
		printf("%hd\n", R7);
		return 0;
	}
	R7 = R1 + 2;
	R6 += 2;
	R5 += 1;
	R4 += 2;
	while(R0 > 0){
		R7 += R4;
		R7 &= 1023;
		R4 = R5 + R5;
		R5 = R6;
		R6 = R7;
		R0 --;
	}
	printf("%hd\n", R7);
	return 0;
}