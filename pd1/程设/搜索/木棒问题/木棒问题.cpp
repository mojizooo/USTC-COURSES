/*
	输入：
	9
	5 2 1 5 2 1 5 2 1
	0
	输出：
	6 （5+1 5+1 2+2+2）（最小可能）
*/

/*
	剪枝1：
	不考虑替换第i根棍子中第1根用于拼接的木棒
	剪枝2：
	后续拼接若无法成功，不考虑替换最后一根木棒
	剪枝3：
	L长度若不可，下一次拼接跳过所有长度为L的木棒
	剪枝4：
	所有拼接按从长到短进行
*/

#include <iostream>
#include <memory.h>
#include <cstdlib>
using namespace std;
int T, S;
int L;
int anLength[65];
int anUsed[65];
int i,j,k;
int Dfs(int nUnusedSticks, int nLeft);
int MyCompare( const void * e1, const void * e2) {
	int * p1, * p2;
	p1 = (int * ) e1;
	p2 = (int * ) e2;
	return * p2 - * p1;
}
int main()
{
	while(1) {
		cin >> S;
		if( S == 0 )
			break;
		int nTotalLen = 0;
		for( int i = 0; i < S; i ++ ) {
			cin >> anLength[i];
			nTotalLen += anLength[i];
		}
		qsort(anLength,S,sizeof(int),MyCompare);
		for( L = anLength[0]; L <= nTotalLen / 2; L ++ ) {
		if( nTotalLen % L)
			continue;
		memset( anUsed, 0,sizeof(anUsed));
		if( Dfs( S,L)) {
			cout << L << endl;
			break;
		}
	 }
	if( L > nTotalLen / 2 )
		cout << nTotalLen << endl;
    } // while
}
/*int Dfs( int nUnusedSticks, int nLeft)
// nLeft表示当前正在拼的棍子和 L 比还缺的长度
{
	if( nUnusedSticks == 0 && nLeft == 0 )
		return true;
	if( nLeft == 0 ) //一根刚刚拼完
		nLeft = L;  //开始拼新的一根
	for( int i = 0;i < S;i ++) {
		if( !anUsed[i] && anLength[i] <= nLeft) {
			if( i > 0 ) {
				if( anUsed[i-1] == false 
				   && anLength[i] == anLength[i-1])
					continue; //剪枝3
			}
			anUsed[i] = 1;
			if ( Dfs( nUnusedSticks - 1,
				 nLeft - anLength[i]))
				return true;
			else {
				anUsed[i] = 0;//说明本次不能用第i根
						//第i根以后还有用

				if( anLength[i] == nLeft || nLeft == L)
					return false; //剪枝2、1
			}
		}
	}
	return false;
}*/
int Dfs( int nUnusedSticks, int nLeft)
// nLeft表示当前正在拼的棍子和 L 比还缺的长度
{
	if( nUnusedSticks == 0 && nLeft == 0 )
		return true;
	if( nLeft == 0 ) //一根刚刚拼完
		nLeft = L;  //开始拼新的一根
	int nStartNo = 0;//, nLastStickNo = 0; 
	/*if( nLeft != L ) //剪枝4
		nStartNo = nLastStickNo + 1;*/
	for( int i = nStartNo;i < S;i ++) {
		if( !anUsed[i] && anLength[i] <= nLeft) {
			if( i > 0 ) {
				if( anUsed[i-1] == false 
				   && anLength[i] == anLength[i-1])
					continue; //剪枝3
			}
			anUsed[i] = 1; //nLastStickNo = i;
            if ( Dfs( nUnusedSticks - 1,
				 nLeft - anLength[i]))
				return true;
			else {
				anUsed[i] = 0;//说明本次不能用第i根
						//第i根以后还有用

				if( anLength[i] == nLeft || nLeft == L)
					return false;//剪枝2、1
			}
		}
	}
	return false;
}
