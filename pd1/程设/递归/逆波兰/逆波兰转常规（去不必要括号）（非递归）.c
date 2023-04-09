#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 100
int Low_level = 2, High_level = 1, Initial_level = 0;//三个Level分别对应优先级
typedef struct                                       //+,-运算后的项为Low;*,/运算后的项为High;基本的数为Initial;
{   /*
     *定义结构体Len储存项的长度（如a+b为3，(a+b)为5)
     *Len储存项的长度（如a+b为3，(a+b)为5)
     *Level储存优先级
     *Expr储存项对应的字符串
    */
	int Len, Level;
	char Expr[2 * MAX];
} St;
void solve(char *input, St *stack)//主函数 input为输入的逆波兰式 stack为结构体数组
{
	int top = 0;                  //记录当前最高项的位置 从0开始
	char c;                       //c用于从input中读入字符
	St *left, *right;             //left为进行计算时左边（即靠前）的项 right同理
	while ( (c = *(input++)) != 0)
	{
		switch (c)
		{//低优先级运算情况
		case '+':
		case '-':
			left = &stack[top - 2];  
			right = &stack[top - 1]; //与运算符最近的相邻两项
			top--;                   //最终结果储存在left中，right重新利用

			left->Expr[left->Len++] = c;   //插入算符，长度加一
			if (right->Level == Low_level) //如果将要被+或-的项已被操作过且为低优先级，右边加括号
			{   
				left->Expr[left->Len++] = '(';
				memcpy(left->Expr + left->Len, right->Expr, right->Len);
				left->Len += right->Len;
				left->Expr[left->Len++] = ')';
			}
			else                            //如果尚未被操作，则直接插入
			{
				memcpy(left->Expr + left->Len, right->Expr, right->Len);
				left->Len += right->Len;
			}
			left->Expr[left->Len] = 0; //最后一项为'\0'
			left->Level = Low_level;   //优先级改变
			break;
		case '*':
		case '/':
			left = &stack[top - 2];
			right = &stack[top - 1];
			top--;

			if (left->Level == Low_level) //如果将要被*或/的项已被操作过且为低优先级，两边均加括号
			{
				memmove(left->Expr + 1, left->Expr, left->Len);
				left->Expr[0] = '(';
				left->Expr[1 + left->Len] = ')';
				left->Len += 2;
			}
			left->Expr[left->Len++] = c;  //插入算符
			if (right->Level > 0)         //此处只要是操作过的项则会发生运算顺序的改变，故用最初优先级控制
			{
				left->Expr[left->Len++] = '(';
				memcpy(left->Expr + left->Len, right->Expr, right->Len);
				left->Len += right->Len;
				left->Expr[left->Len++] = ')';
			}
			else                          //若尚未被操作，直接插入
			{
				memcpy(left->Expr + left->Len, right->Expr, right->Len);
				left->Len += right->Len;
			}
			left->Expr[left->Len] = 0;
			left->Level = High_level;     //优先级改变
			break;
		default:
			stack[top].Len = 1;                //未遇见运算符时的情况
			stack[top].Level = Initial_level;
			stack[top].Expr[0] = c;
			stack[top].Expr[1] = 0;
			top++;                             //开辟下一个数组储存数据
			break;
		}
	}
	printf("%s\n", stack[0].Expr);             //输出结果
}
int main()
{
	char *input;
	St *stack;
	input = (char *)malloc(MAX * sizeof(char));
	stack = (St *)malloc(MAX * sizeof(St));
	while (fgets(input, MAX, stdin) != NULL)//从输入流中读入逆波兰式
	{
		solve(input, stack);
	}
	free(input);                            //释放内存
	free(stack);
	return 0;
}