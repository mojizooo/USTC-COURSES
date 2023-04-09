/*成功即返回地址
 *失败即返回NULL
 *据此可判断输入完成
 *更新标准库中已被删除
 */
#include <stdio.h>
int main(void) 
{
	char s[200];
	char * p  = gets(s);
	   /*成功即返回地址
 		*失败即返回NULL
 		*据此可判断输入完成
 		*更新标准库中已被删除
 		*/
	printf("%s:%s",s,p);
	return 0; 
}
