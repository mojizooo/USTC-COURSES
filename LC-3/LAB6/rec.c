#include <stdio.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;
short int memory[128];
int main(){
	memory[25] = 5;
	R2 = 15;
	R0 = 0;
	R7 = 3;
	while(1){
		memory[R2] = R7;
		R2 += 1;
		R0 += 1;
		R1 = memory[25];
		R1--;
		memory[25] = R1;
		if(R1) R7 = 12;
		else break;
	}
	while(R7 == 12){
		R2--;
		R7 = memory[R2];
	}
	for(int i = 15; i < 26; i++){
		printf("%d ", memory[i]);
	}
	putchar(10);
	printf("%d %d %d %d %d %d %d %d ", R0, R1, R2, R3, R4, R5, R6, R7);
	return 0;
}