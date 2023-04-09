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
{	//栈的生成
	int_stackbase_ptr = (int *)malloc(sizeof(int)*STACK_INIT_SIZE); //初始化及分配空间
	if (int_stackbase_ptr){
		//如果分配成功
		int_stacktop_ptr = int_stackbase_ptr;   //栈顶和栈底指针同时初始化
		int_stacksize = STACK_INIT_SIZE;		//给予栈与分配的空间大小
	}
	else exit(0);                               //否则退出
}

int stackEmpty()
{	//判断栈是否为空
	if (int_stackbase_ptr == int_stacktop_ptr) return 1;    //以栈顶指针和栈底指针是否相同为判断条件
	else return 0;
}

int getTop()
{	//获取栈顶元素
	if (int_stackbase_ptr == int_stacktop_ptr) return 0;	//以栈顶指针和栈底指针是否相同为判断条件
	else return *(int_stacktop_ptr - 1);					//若非空，获取栈顶元素（其地址为当前栈顶指针前移一位）
}

void clearStack()
{	//清空栈
	int_stacktop_ptr = int_stackbase_ptr;	//初始化栈顶栈底指针视为清空
}

void destroyStack()
{	//摧毁栈
	free(int_stackbase_ptr);
}

int stackLength()
{//获取栈的长度
	return int_stacktop_ptr - int_stackbase_ptr;	//获取目前栈中元素个数
}

int pop()
{//元素出栈
	if (int_stacktop_ptr == int_stackbase_ptr) return 0;
	else return *(-- int_stacktop_ptr);    //若栈非空则获取栈顶元素同时栈顶指针前移一位代表当前栈顶元素已不在栈内
}

int push(int e)
{//元素入栈
	if (int_stacktop_ptr - int_stackbase_ptr >= int_stacksize){
		//如果当前栈空间大于原本预分配的栈空间则重新分配更多空间
		int_stackbase_ptr = (int *)realloc(int_stackbase_ptr, (int_stacksize + STACKINCREMENT) * sizeof(int));
	}
	if (!int_stackbase_ptr) exit(0);	//分配失败则退出程序
	int_stacktop_ptr = int_stackbase_ptr + int_stacksize;	//初始化栈顶
	int_stacksize += STACKINCREMENT;	
	*(int_stacktop_ptr++) = e;	//元素入栈，同时栈顶指针
}

int main(int argc, char const *argv[])
{
	initStack();

	int x;

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