void qsort(void *base, int nelem, unsigned int width, 
    int ( * pfCompare)( const void *, const void *));
/*
	base是待排序数组的起始地址，
    nelem是待排序数组的元素个数，
    width是待排序数组的每个元素的大小（以字节为单位）
    pfCompare是一个函数指针，它指向一个“比较函数”。该比较函数应是返回值为int,有两个参数为const void * 的函数
    比较函数应满足：
    1) 如果 * elem1应该排在 * elem2前面，则函数返回值是负整数（任何负整数都行）。
	2) 如果 * elem1和* elem2哪个排在前面都行，那么函数返回0
	3) 如果 * elem1应该排在 * elem2后面，则函数返回值是正整数（任何正整数都行）。
*/
#include <stdio.h>
#include <stdlib.h>
int MyCompare( const void * elem1, 
		   const void * elem2 )
{
	unsigned int * p1, * p2;
	p1 = (unsigned int *) elem1;		 
	p2 = (unsigned int *) elem2;		 
	return  (* p1 % 10)  - (* p2 % 10 ); 
}
#define NUM 5
int main(void)
{
	unsigned int an[NUM] = { 8,123,11,10,4 };
	qsort( an,NUM,sizeof(unsigned int),
		MyCompare);  
	for( int i = 0;i < NUM; i ++ )
		printf("%d ",an[i]);
    return 0;
}
