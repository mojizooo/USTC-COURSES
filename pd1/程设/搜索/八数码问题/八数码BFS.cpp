
#include <iostream>
#include <string.h>
using namespace std;
int nGoalStatus;  //目标状态
unsigned char szFlag[48427562]; //节点是否扩展的标记
char szResult[1000000];
char szMoves[1000000]; //移动步骤  
int anFather[1000000]; //父节点指针 
int MyQueue[1000000];  //状态队列
int nQHead; 
int nQTail;
char sz4Moves[] = "udrl";//四种动作
int NineToTen( char * s )
//九进制字符串转十进制
{
	int nResult = 0;
	for( int i = 0; s[i]; i ++ ) {
		nResult *= 9;
		nResult += s[i] - '0';
	}
	return nResult;
}
int GetBit( unsigned char c,int n)  {
	return ( c >> n ) & 1;
}
void SetBit( unsigned char & c, int n,int v)  {
	if( v )
		c |= (1 << n);
	else
		c &= ~(1 << n);

}
int TenToNine( int n, char * s)
//十进制数转九进制字符串。可能有前导0
//返回0的位置
{
	int nZeroPos;
	int nBase = 1;
	int j = 0;
	while( nBase <= n)
		nBase *= 9;
	nBase /= 9;
	do {
		s[j] = n/nBase + '0';
		if( s[j] == '0' )
			nZeroPos = j;
		j ++;
		n %= nBase;
		nBase /= 9;
	}while( nBase >= 1 );
	s[j] = 0;
	//判是否要加前导0
	if( j < 9 ) {
		for( int i = j + 1; i > 0; i --)
			s[i] = s[i-1];
		s[0] = '0';
		return 0;
	}
	return nZeroPos;
}
int NewStatus( int nStatus, char cMove)
//求从nStatus经过 cMove 移动后得到的新状态
//若移动不可行则返回-1
{ 	char szTmp[20];
	int nZeroPos = TenToNine(nStatus,szTmp);
	switch( cMove) {
		case 'u':
			if( nZeroPos - 3 < 0 )
				return -1;
			else {
				szTmp[nZeroPos] = szTmp[nZeroPos - 3];
				szTmp[nZeroPos - 3] = '0';
			}
			break;
		case 'd':
			if( nZeroPos + 3 > 8 )
				return -1;
			else {
				szTmp[nZeroPos] = szTmp[nZeroPos + 3];
				szTmp[nZeroPos + 3] = '0';
			}
			break;
			case 'l':
			if( nZeroPos % 3 == 0)
				return -1;
			else {
				szTmp[nZeroPos] = szTmp[nZeroPos -1];
				szTmp[nZeroPos -1 ] = '0';
			}
			break;
		case 'r':
			if( nZeroPos % 3 == 2)
				return -1;
			else {
				szTmp[nZeroPos] = szTmp[nZeroPos + 1];
				szTmp[nZeroPos + 1 ] = '0';
			}
			break;
	}
	return NineToTen(szTmp);
}
bool Bfs(int nStatus)
{
	int nNewStatus;
	nQHead = 0;
	nQTail = 1;
	MyQueue[nQHead] = nStatus;
	while ( nQHead != nQTail) { //队列不为空
		nStatus = MyQueue[nQHead];
		if( nStatus == nGoalStatus ) {//找到目标状态 
			return true;
		}
		for( int i = 0;i < 4;i ++ ) { //尝试4种移动
			nNewStatus = NewStatus(nStatus,sz4Moves[i]);	
			if( nNewStatus == -1 ) 
				continue; //不可移，试下一种移法
			int nByteNo = nNewStatus / 8;
			int nBitNo = nNewStatus % 8;
			if( GetBit( szFlag[nByteNo],nBitNo)) 
				continue; //如果扩展标记已经存在，
					    //则不能入队
			//设上已扩展标记
			SetBit( szFlag[nByteNo],nBitNo,1); 	
			//新节点入队列 
			MyQueue[nQTail] = nNewStatus; 				
			anFather[nQTail] = nQHead; //记录父节点
			szMoves[nQTail] = sz4Moves[i];
			nQTail ++;
		    //记录本节点是由父节点经什么动作而来			 				
		}
		nQHead ++; 
	}
	return false;	
}
int main()
{
	nGoalStatus = NineToTen("123456780");
	memset(szFlag,0,sizeof(szFlag));
	char szLine[50];
	char szLine2[20];
	cin.getline(szLine,48);
	int i,j;
	//将输入的原始字符串变为九进制字符串
	for( i = 0, j = 0; szLine[i]; i ++ ) {
		if( szLine[i] != ' ' ) {
			if( szLine[i] == 'x' )
				szLine2[j++] = '0';
			else
				szLine2[j++] = szLine[i];
		}
	}
	szLine2[j] = 0;
	if( Bfs(NineToTen(szLine2))) {
		int nMoves = 0;
		int nPos = nQHead;
		do { 
			szResult[nMoves++] = szMoves[nPos];
			nPos = anFather[nPos]; 
		} while( nPos);
		for( int i = nMoves -1; i >= 0; i -- ) {
			cout << szResult[i];
		}
	}
	else
		cout << "unsolvable" << endl;
	 
}
