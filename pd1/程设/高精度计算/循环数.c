/*
	输入：
	N位整数与1≤Y≤N相乘可以得到自身的一个循环
	如142857.
	输出：
	判断是否位循环数

*/
#include <stdio.h>
#include <string.h>
#define MAX_LEN 201
int an1[MAX_LEN+10];
int an2[MAX_LEN+10];
char szLine1[MAX_LEN+10];
char szLine2[MAX_LEN+10];
char szDouble[2 * MAX_LEN + 10];
int Add(int nMaxLen , int * an1, int * an2)
//将长度最多为 nMaxLen 的大整数 an1和an2 相加，结果放在an1
//an1[0],an2[0]对应于个位
{
	int nHighestPos = 0;
	for(int i = 0;i < nMaxLen; i ++ ) {	
		an1[i] += an2[i];		//逐位相加
		if( an1[i] >= 10 ) {		//看是否要进位	
			an1[i] -= 10;
			an1[i+1] ++;			//进位
		}
		if( an1[i] )
			nHighestPos = i; //记录最高位的位置
	}
	return nHighestPos;
}

int main(void)
{
	while( gets( szLine1 ) && szLine1[0] ) {
		int i, j;
	//库函数memeset将地址an1开始的sizeof(an1)字节内容置成0
		//sizeof(an1)的值就是an1的长度
		//memset函数在string.h中声明
		memset( an1, 0, sizeof(an1));	
		memset( an2, 0, sizeof(an1));	
	//下面将szLine1中存储的字符串形式的整数转换到an1中去，
		//an1[0]对应于个位
		int nLen1 = strlen( szLine1);
		for(j = 0, i = nLen1 - 1;i >= 0 ; i --) {
			an1[j] = szLine1[i] - '0';	
			an2[j++] = szLine1[i] - '0';	
		}
		strcpy( szDouble, szLine1);
		strcat( szDouble, szLine1);
		bool bOk = true;
		for( i = 1; i < nLen1; i ++ ) {
			int nHighestPos = Add(MAX_LEN,an1,an2);
			if ( nHighestPos >= nLen1 ) { //长度超出了
				bOk = false;
				break;
			}
			for( int k = 0; k < nLen1; k ++ )  //转换成字符串
				szLine2[nLen1- k - 1] = an1[k] + '0';				szLine2[nLen1] = 0;
			if( strstr( szDouble ,szLine2 ) == NULL ) {
				bOk = false;
				break;
			}
		}
		if( bOk) 
			printf( "%s is cyclic\n",szLine1);
		else
			printf( "%s is not cyclic\n",szLine1);
	}
    return 0;
}
