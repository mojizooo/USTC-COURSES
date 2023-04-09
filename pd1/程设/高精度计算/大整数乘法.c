/*
	同加法
	但保证相乘两数的位数
*/

/*
	思路：
	先累加，最后处理进位

*/

#include <stdio.h>
#include <string.h>
#define MAX_LEN 200
unsigned an1[MAX_LEN+10];
unsigned an2[MAX_LEN+10];
unsigned aResult[MAX_LEN * 2 + 10];
char szLine1[MAX_LEN+10];
char szLine2[MAX_LEN+10];
int main(void)
{
	gets( szLine1); //gets函数读取一行
	gets( szLine2);
	int i, j;
	int nLen1 = strlen( szLine1);
	memset( an1, 0, sizeof(an1));
	memset( an2, 0, sizeof(an2));
	memset( aResult, 0, sizeof(aResult));	
	j = 0;
	for( i = nLen1 - 1;i >= 0 ; i --)
		an1[j++] = szLine1[i] - '0';
	int nLen2 = strlen(szLine2);
	j = 0;
	for( i = nLen2 - 1;i >= 0 ; i --)
		an2[j++] = szLine2[i] - '0';
	//每一轮都用an1的一位，去和an2各位相乘，从an1的个位开始
	for( i = 0;i < nLen2; i ++ ) 	{				
		//用选定的an1的那一位，去乘an2的各位 
		for( j = 0; j < nLen1; j ++ ) 			
			//两数第i, j位相乘，累加到结果的第i+j位
			aResult[i+j] += an2[i]*an1[j]; 	
	}
	//下面的循环统一处理进位问题
	int nHighestPos = 0;
	for( i = 0; i < MAX_LEN * 2; i ++ )	{
		if( aResult[i] >= 10 ) {
			aResult[i+1] += aResult[i] / 10;
			aResult[i] %= 10;
		}
		if( aResult[i] )	nHighestPos = i;
	}
	for( i = nHighestPos; i >= 0; i -- )
		printf("%d", aResult[i]);
	return 0;
}

