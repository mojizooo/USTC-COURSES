#include <stdio.h>
short int R0, R1, R2, R3, R4, R5, R6, R7;

int mul(){
	R3 += R4;
	R6 = ~R3;
	R6++;
	R6 += R0;
	if(R6 < 0) return 0;
	return 1;
}

int WHILE(){
	R4++;
	R5 = R4;
	R3 = 0;
	while(R5){
		if(mul() == 0) return 0;
		else R5--;
	}
	return 1;

}
int judge(){
	R2 = R4;
	R2 = ~R2;
	R2 += 1;
	R5 = R0;
	while(R5 > 0)
		R5 += R2;
	if(R5 == 0){
		R1 -= 1;
		return 0;
	}
	else {
		if(WHILE())
			return 1;
		else return 0;
	}

}
int main(){
	scanf("%hd", &R0);
	R4 += 2;
	R1 += 1;
	if(R0 < 4) return 0;
	while(judge());
	printf("%hd\n", R1);
	return 0;
}