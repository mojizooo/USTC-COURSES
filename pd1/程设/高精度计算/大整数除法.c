/*
	同减法
	保证有整数商
*/

#include <stdio.h>
#include <string.h>
#define MAX_LEN 110
int an1[MAX_LEN];
int an2[MAX_LEN];
int tmpAn2[MAX_LEN];
int anResult[MAX_LEN];
char szLine1[MAX_LEN];
char szLine2[MAX_LEN];
char szNouse[MAX_LEN];
int Substract( int nMaxLen, int * an1, int * an2)
//大整数an1减去an2。两者最多 nMaxLen 位，an1必须不小于an2, 差放在an1里
//返回差的最高非0位的位置
{	int nStartPos = 0;
	for( int i = 0;i < nMaxLen ; i ++ ) {	
		an1[i] -= an2[i];		//逐位相
		if( an1[i] < 0 ) {		//看是否要进位	
			an1[i] += 10;
			an1[i+1] --;	//进位
		}
		if( an1[i] )
			nStartPos = i; //记录最高位的位置
	}
	return nStartPos;
}

int Length( int nMaxLen,int * an)
//求大整数的位数。0 算 0 位
{	
	int i;
	for( i = nMaxLen -1 ; an[i] == 0 && i >= 0; i -- );
	if( i >= 0 )
		return i + 1;
	return 0;
}
void ShiftLeft( int nMaxLen,int * an1, int * an2, int n)
//将大整数an1左移n位，即乘以10的n次方，结果放到an2里
{
	memcpy( an2,an1,nMaxLen * sizeof(int));
	if( n <= 0 )
		return;
	for( int i = nMaxLen -1 ; i >= 0; i -- )
		if( i - n >= 0)
			an2[i] = an1[i-n];
		else
			an2[i] = 0;
}

int * Max(int nMaxLen, int * an1, int * an2)
//求大整数an1和an2里面大的那个
//如果都是0，则返回NULL
{
	bool bBothZero = true;
	for( int i = nMaxLen -1; i >= 0 ; i -- ) {
		if( an1[i] > an2[i] )
			return an1;
		else if( an1[i] < an2[i] )
			return an2;
		else if( an1[i] )
			bBothZero = false;
	}
	if( bBothZero)
		return NULL;
	return an1;
}

int main(void)
{
	int n;
	scanf("%d",&n);
	gets(szNouse);
	while(n -- ) {
		gets(szLine1);
		gets(szLine2);
		gets(szNouse);
		int i, j;
		//库函数memeset将地址an1开始的sizeof(an1)字节内容置成0
		//sizeof(an1)的值就是an1的长度
		//memset函数在string.h中声明
		memset( an1, 0, sizeof(an1));	
		memset( an2, 0, sizeof(an2));
		//下面将szLine1中存储的字符串形式的整数转换到an1中去，
		//an1[0]对应于个位
		int nLen1 = strlen( szLine1);
		for(j = 0, i = nLen1 - 1;i >= 0 ; i --)
			an1[j++] = szLine1[i] - '0';	
		int nLen2 = strlen(szLine2);
		for( j = 0, i = nLen2 - 1;i >= 0 ; i --)
			an2[j++] = szLine2[i] - '0';
				int nHighestPos = 0;
		memset(anResult,0,sizeof(anResult));
		int nShiftLen = Length(MAX_LEN,an1) - Length(MAX_LEN,an2);
		//只要an1大于an2，就不停相减
		while( Max(MAX_LEN,an1,an2) == an1 ) {
			//算出an1的10的nShiftLen次方倍
			ShiftLeft(MAX_LEN, an2, tmpAn2,nShiftLen);
			//重复减去an1的10的nShiftLen次方倍，看能减几次
			while( Max(MAX_LEN,an1,tmpAn2) == an1) {
				Substract(MAX_LEN, an1,tmpAn2);
				//记录商对应位
				anResult[nShiftLen] ++;
			}
			//记录结果最高位的位置
			if( nHighestPos == 0 && anResult[nShiftLen])
				nHighestPos = nShiftLen;
			nShiftLen --;
		}
		for( i = nHighestPos; i >= 0; i -- ) 
			printf("%d", anResult[i]);
		printf("\n");
	}
    return 0;
}