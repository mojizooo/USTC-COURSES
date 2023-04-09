#include <stdio.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;

void div_by_8(){
	R2 = 0;
	R3 = 0;
	R4 = 0;
	R2++;
	R3 += 8;
	while(R3){
		R5 = R3 & R1;
		if(R5) R4 += R2;
		R2 += R2;
		R3 += R3;
	}
}

int main(){
	scanf("%hd", &R1);
	while(1){
		div_by_8();
		R2 = R1 & 7;
		R1 = R2 + R4;
		if(R1 > 7) continue;
		else if(R1 == 7) R1 -= 7;
		break;
	}
	printf("%hd\n", R1);
	return 0;
}
