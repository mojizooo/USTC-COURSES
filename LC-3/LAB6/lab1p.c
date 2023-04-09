#include <stdio.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;
int main(){
	scanf("%hd %hd", &R0, &R1);
	R7 = 0;
	R2 = R7 + 1;
	while(R2){
		if(R2 & R1){
			R7 = R7 + R0;
		}
		R0 = R0 + R0;
		R2 = R2 + R2;
	}
	printf("%hd\n", R7);
	return 0;
}