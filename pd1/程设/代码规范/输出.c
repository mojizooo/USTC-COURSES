/*
 * %d int
 * %c char
 * %f float
 * %lf double
 * %e science
 * %x 十六进制或int
 * %p 指针地址
 */
#include <stdio.h>
int main(void) 
{
	int a;
	char b;
	char c[20];
	double d = 0;
	float e = 0;
	int n = scanf("%d%c%s%lf%f",&a,&b,c,&d,&e);
	printf("%d %c %s %lf %e %f %d",a,b,c,d,e,e,n);
	return 0; 
}