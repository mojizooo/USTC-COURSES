/*
	输入：
	s t 确认是否s是t的子序列（即t经过删除可以得到s）
	输出：
	yes or no
*/

#include <stdio.h>
char s[100010];
char t[100010];
int main(void)
{
	int i,j;
	while (scanf( "%s%s",s,t) > 0 ) {
		for( i = 0,j = 0 ; s[i] && t[j]; j ++ ) {
			if( t[j] == s[i] )
				i ++;
		}
		if ( s[i] == 0)  // ‘\0’ 的Ascii 码就是 0
			printf("Yes\n");
		else
			printf("No\n");
	}
	return 0;
}