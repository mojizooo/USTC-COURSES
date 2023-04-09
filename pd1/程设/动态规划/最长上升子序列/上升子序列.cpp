#include <stdio.h>
#include <memory.h>
#define MAX_N 1000
int b[MAX_N + 10];
int aMaxLen[MAX_N + 10];
int main()
{	
	int N;
	int i;
	scanf("%d", & N);
	for( i = 1;i <= N;i ++ )
		scanf("%d", & b[i]);
	aMaxLen[1] = 1;
	for( i = 2; i <= N; i ++ ) { 
		//每次求以第i个数为终点的最长上升子序列的长度
		int nTmp = 0;  //记录满足条件的，第i个数左边的上升子序列的最大长度
        for( int j = 1; j < i; j ++ ) { //察看以第j个数为终点的最长上升子序列
			if( b[i] > b[j] ) { 
				if( nTmp < aMaxLen[j] )
					nTmp = aMaxLen[j];
			}
		}
		aMaxLen[i]  = nTmp + 1;
	}
	int nMax = -1;
	for( i = 1;i <= N;i ++ )
		if( nMax < aMaxLen[i])
			nMax = aMaxLen[i];
	printf("%d\n", nMax);
}
