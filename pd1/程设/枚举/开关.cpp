/*
	输入：
	初始状态
	0 1 1 0 1 0
	1 0 0 1 1 1
	0 0 1 0 0 1
	1 0 0 1 0 1
	0 1 1 1 0 0
	输出：
	需要按下哪些位置按钮使灯全部熄灭
	1 0 1 0 0 1
	1 1 0 1 0 1
	0 0 1 0 1 1
	1 0 0 1 0 0
	0 1 0 0 0 0
*/

#include <memory.h>
#include <cstring>
#include <iostream>
using namespace std;
int T;  int anPuzzle[6][6];
int anOriPuzzle[6][6];
int anSwitch[6][6]; //开关状态
int i,j;
void OutputResult(int t) //输出结果
{
	cout << "PUZZLE #" << t << endl;
	for( int i = 0;i < 5; i ++ ) {
		for( int j = 0; j < 6; j ++ ) {
			cout << anSwitch[i][j];
			if( j < 5 ) cout << " ";
		}
		cout << endl;
	}
}

void ApplySwitch( int * pLights, int * pNextLights, int * pSwitchs)  {
	for( int i = 0;i < 6; i ++ ) { //依次让每个开关起作用
		if( pSwitchs[i] ) {
			//开关左边的灯改变状态
			if( i > 0 )
				pLights[i-1] = 1 - pLights[i-1];
			//开关所在位置的灯改变状态
			pLights[i] = 1 - pLights[i];
			//开关右边的灯改变状态
			if( i < 5) 
				pLights[i+1] = 1 - pLights[i+1];
			//开关下边的灯改变状态
			pNextLights[i] = 1 - pNextLights[i];
		}
	}
}

void SwitchStatus( int n, int * pSwitch)
{
	for( i = 0;i < 6 ;i ++ )
		pSwitch[i] = (n >> i ) & 1;
}

int main()   {
	cin >> T;
	for( int t = 0; t < T; t ++ ) {
		for( i = 0;i < 5; i ++ )
			for(  j = 0; j < 6; j ++ ) 
				cin >> anOriPuzzle[i][j];
		for( int n = 0; n < 64; n ++ ) { //遍历首行开关的64种状态
			memcpy( anPuzzle,anOriPuzzle,sizeof(anPuzzle));
			//算出n所代表的开关状态，放到anSwitch[0]
			SwitchStatus( n, anSwitch[0]);
//下面逐行让开关起作用，并算出下一行开关应该是什么状态，再让它们起作用……
			for( int k = 0; k < 5; k ++ ) {
				//算出第k行开关起作用后的结果
				ApplySwitch( anPuzzle[k],
					anPuzzle[k+1],anSwitch[k]);
			//第k+1行的开关状态应和第k行的灯状态一致
				memcpy( anSwitch[k+1], 							anPuzzle[k],sizeof(anPuzzle[k]));
			}
			bool bOk = true; //记录最后一行灯是不是全灭
			//看最后一行灯是不是全灭
			for(  k = 0; k < 6; k ++ ) {
				if( anPuzzle[4][k] ) {
					bOk = false;
					break;
				}
			}
			if( bOk )  {
				OutputResult(t+1); //输出解
				break; //找到解，就不用再试下一种状态了
			}
		} // for( int n = 0; n < 64; n ++ ) 
	}
}
