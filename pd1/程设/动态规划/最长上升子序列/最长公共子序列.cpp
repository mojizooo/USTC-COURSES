#include <iostream>
#include <string.h>
using namespace std;
char sz1[1000];
char sz2[1000];
int anMaxLen[1000][1000];
int main()
{
	while( cin >> sz1 >> sz2 ) {
		int nLength1 = strlen( sz1);
		int nLength2 = strlen( sz2);
		int nTmp;
		int i,j;
		for( i = 0;i <= nLength1; i ++ )
			anMaxLen[i][0] = 0;
		for( j = 0;j <= nLength2; j ++ )
			anMaxLen[0][j] = 0;
		for( i = 1;i <= nLength1;i ++ )  {
			for( j = 1; j <= nLength2; j ++ ) {
				if( sz1[i-1] == sz2[j-1] )
					anMaxLen[i][j] = 
						anMaxLen[i-1][j-1] + 1;
				else {
					int nLen1 = anMaxLen[i][j-1];
					int nLen2 = anMaxLen[i-1][j];
					if( nLen1 > nLen2 )
						anMaxLen[i][j] = nLen1;
					else
						anMaxLen[i][j] = nLen2;
				}
			}
		}
		cout <<  anMaxLen[nLength1][nLength2] << endl;
	}
}