#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define STACK_INIT_SIZE 100
#define STACKINCREMENT 1
#define ElemType char

//顺序整数栈的静态结构
unsigned int_stacksize;		 //预分配的栈空间大小
ElemType *int_stacktop_ptr;	 //栈顶指针
ElemType *int_stackbase_ptr; //栈底指针

//8个实现栈的基本操作的函数
void initStack()
{ //栈的生成
	int_stackbase_ptr = (ElemType *)malloc(sizeof(ElemType) * STACK_INIT_SIZE);
	if (int_stackbase_ptr)
	{
		int_stacktop_ptr = int_stackbase_ptr;
		int_stacksize = STACK_INIT_SIZE;
	}
	else
		exit(0);
}

int stackEmpty()
{ //判断栈是否为空
	if (int_stackbase_ptr == int_stacktop_ptr)
		return 1;
	else
		return 0;
}

ElemType getTop()
{ //获取栈顶元素
	if (int_stackbase_ptr == int_stacktop_ptr)
		return 0;
	else
		return *(int_stacktop_ptr);
}

void clearStack()
{ //清空栈
	int_stacktop_ptr = int_stackbase_ptr;
}

void destroyStack()
{ //摧毁栈
	free(int_stackbase_ptr);
}

int stackLength()
{ //获取栈的长度
	return int_stacktop_ptr - int_stackbase_ptr;
}

ElemType pop()
{ //元素出栈
	if (int_stacktop_ptr == int_stackbase_ptr)
		return 0;
	else
		return *(int_stacktop_ptr--);
}

ElemType push(ElemType e)
{ //元素入栈
	if (int_stacktop_ptr - int_stackbase_ptr >= int_stacksize)
	{
		int_stackbase_ptr = (ElemType *)realloc(int_stackbase_ptr, (int_stacksize + STACKINCREMENT) * sizeof(ElemType));
	}
	if (!int_stackbase_ptr)
		exit(0);
	int_stacksize += 1;
	*(++int_stacktop_ptr) = e;
}

typedef struct
{
	ElemType *elem;
	int length;
	int listsize;
} SqList;


int main(int argc, char const *argv[])
{
	initStack();
	char c;
	int i = 0;
	scanf("%c",&c);
	while(c != '@'){
		a[i++] = c;
		scanf("%c",&c);
	}
	puts(a);
	return 0;
}