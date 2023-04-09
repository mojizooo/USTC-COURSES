/*
  以D(r,j)代表对应坐标数字，MaxSum代表从某个数字开始最好路径的数字之和
*/
#include <stdio.h>
#define MAX_NUM 100
int D[MAX_NUM+10][MAX_NUM+10];
int N;
int aMaxSum[MAX_NUM+10][MAX_NUM+10];
int main(int argc, char const *argv[])
{
	int i,j;
	scanf("%d",&N);
	for(i=1;i<=N;i++)
		for(j=1;j<=i;j++){
			scanf("%d",&D[i][j]);
			aMaxSum[i][j]=D[i][j];
		}
	for(i=N;i>1;i--)
		for(j=1;j<i;j++){
			if(aMaxSum[i][j]>aMaxSum[i][j+1])
				aMaxSum[i-1][j]=aMaxSum[i][j]+D[i-1][j];
			else
				aMaxSum[i-1][j]=aMaxSum[i][j+1]+D[i-1][j];
			printf("%d\n",aMaxSum[i-1][j]);
		}
	printf("%d\n",aMaxSum[1][1]);
	return 0;
}
/*
7
3 8
8 1 0
2 7 4 4
4 5 2 6 5
*/
/*#define MAX_NUM 100
int D[MAX_NUM + 10][MAX_NUM + 10];  int N;
int aMaxSum[MAX_NUM + 10];
int main() {
	int i, j; 
	scanf("%d", & N); 
	for( i = 1; i <= N; i ++ ) 
		for( j = 1; j <= i; j ++ ) 
			scanf("%d", &D[i][j]);
	for(  j = 1; j <= N; j ++ )
		aMaxSum[j] = D[N][j];
	for( i = N ; i > 1 ; i -- ) 
		for( j = 1; j < i  ; j ++ ) {
		  if( aMaxSum[j] > aMaxSum[j+1] )
		    aMaxSum[j] = aMaxSum[j] + D[i-1][j];
		  else
		    aMaxSum[j] = aMaxSum[j+1] + D[i-1][j];
		}
	printf("%d", aMaxSum[1]);
}*/