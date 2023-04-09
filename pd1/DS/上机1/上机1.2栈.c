#include <stdlib.h>
#include <stdio.h>

#define STACK_INIT_SIZE 100
#define STACKINCREMENT 10

//顺序整数栈的静态结构
unsigned int_stacksize;  //预分配的栈空间大小
int *int_stacktop_ptr;   //栈顶指针
int *int_stackbase_ptr;  //栈底指针

//8个实现栈的基本操作的函数
void initStack()
{//栈的生成
	int_stackbase_ptr = (int *)malloc(sizeof(int)*STACK_INIT_SIZE);
	if (int_stackbase_ptr){
		int_stacktop_ptr = int_stackbase_ptr;
		int_stacksize = STACK_INIT_SIZE;
	}
	else exit(0);
}

int stackEmpty()
{//判断栈是否为空
	if (int_stackbase_ptr == int_stacktop_ptr) return 1;
	else return 0;
}

int getTop()
{//获取栈顶元素
	if (int_stackbase_ptr == int_stacktop_ptr) return 0;
	else return *(int_stacktop_ptr - 1);
}

void clearStack()
{//清空栈
	int_stacktop_ptr = int_stackbase_ptr;
}

void destroyStack()
{//摧毁栈
	free(int_stackbase_ptr);
}

int stackLength()
{//获取栈的长度
	return int_stacktop_ptr - int_stackbase_ptr;
}

int pop()
{//元素出栈
	if (int_stacktop_ptr == int_stackbase_ptr) return 0;
	else return *(-- int_stacktop_ptr);
}

int push(int e)
{//元素入栈
	if (int_stacktop_ptr - int_stackbase_ptr >= int_stacksize){
		int_stackbase_ptr = (int *)realloc(int_stackbase_ptr, (int_stacksize + STACKINCREMENT) * sizeof(int));
	}
	if (!int_stackbase_ptr) exit(0);
	int_stacktop_ptr = int_stackbase_ptr + int_stacksize;
	int_stacksize += STACKINCREMENT;
	*(int_stacktop_ptr++) = e;
}

int main(int argc, char const *argv[])
{
	initStack();

	int x;
	int i = 0;
	while (i < 5)
	{
		puts("e");
		i += 1;
	}
	x = pop();
	if (x)
		printf("出栈成功%d\n", x);
	else
		printf("栈空，不能出栈\n");

	printf("栈中有%d个元素\n", stackLength());

	if (stackEmpty())
		printf("栈空，无法取栈顶\n");
	else {
		x = getTop();
		if (x)
			printf("栈顶元素是%d \n", x);
	}
	push(3);
	printf("栈中有%d个元素\n" ,stackLength());

	push(4);
	push(5);

	printf("栈中有%d个元素\n" ,stackLength());

	x = pop();
    if (x)
		printf("出栈成功%d \n", x);
	else
		printf("栈空，不能出栈\n" );

 	printf("栈中有%d个元素\n" ,stackLength());

	if (stackEmpty())
		printf("栈空，无法取栈顶\n");
	else {
		x = getTop();
		if (x)
			printf("栈顶元素是%d \n", x);
	}

	clearStack();
	destroyStack();

	return 0;
}