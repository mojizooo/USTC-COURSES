#include <stdlib.h>
#include <stdio.h>

#define STACK_INIT_SIZE 100
#define STACKINCREMENT 10

//˳������ջ�ľ�̬�ṹ
unsigned int_stacksize;  //Ԥ�����ջ�ռ��С
int *int_stacktop_ptr;   //ջ��ָ��
int *int_stackbase_ptr;  //ջ��ָ��

//8��ʵ��ջ�Ļ��������ĺ���
void initStack()
{//ջ������
	int_stackbase_ptr = (int *)malloc(sizeof(int)*STACK_INIT_SIZE);
	if (int_stackbase_ptr){
		int_stacktop_ptr = int_stackbase_ptr;
		int_stacksize = STACK_INIT_SIZE;
	}
	else exit(0);
}

int stackEmpty()
{//�ж�ջ�Ƿ�Ϊ��
	if (int_stackbase_ptr == int_stacktop_ptr) return 1;
	else return 0;
}

int getTop()
{//��ȡջ��Ԫ��
	if (int_stackbase_ptr == int_stacktop_ptr) return 0;
	else return *(int_stacktop_ptr - 1);
}

void clearStack()
{//���ջ
	int_stacktop_ptr = int_stackbase_ptr;
}

void destroyStack()
{//�ݻ�ջ
	free(int_stackbase_ptr);
}

int stackLength()
{//��ȡջ�ĳ���
	return int_stacktop_ptr - int_stackbase_ptr;
}

int pop()
{//Ԫ�س�ջ
	if (int_stacktop_ptr == int_stackbase_ptr) return 0;
	else return *(-- int_stacktop_ptr);
}

int push(int e)
{//Ԫ����ջ
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
		printf("��ջ�ɹ�%d\n", x);
	else
		printf("ջ�գ����ܳ�ջ\n");

	printf("ջ����%d��Ԫ��\n", stackLength());

	if (stackEmpty())
		printf("ջ�գ��޷�ȡջ��\n");
	else {
		x = getTop();
		if (x)
			printf("ջ��Ԫ����%d \n", x);
	}
	push(3);
	printf("ջ����%d��Ԫ��\n" ,stackLength());

	push(4);
	push(5);

	printf("ջ����%d��Ԫ��\n" ,stackLength());

	x = pop();
    if (x)
		printf("��ջ�ɹ�%d \n", x);
	else
		printf("ջ�գ����ܳ�ջ\n" );

 	printf("ջ����%d��Ԫ��\n" ,stackLength());

	if (stackEmpty())
		printf("ջ�գ��޷�ȡջ��\n");
	else {
		x = getTop();
		if (x)
			printf("ջ��Ԫ����%d \n", x);
	}

	clearStack();
	destroyStack();

	return 0;
}