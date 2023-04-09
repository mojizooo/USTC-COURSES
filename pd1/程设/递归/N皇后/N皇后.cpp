#include <stdio.h>
#include <math.h>
#include <string.h>
const int QueenNum = 8;
int anResult[92][QueenNum]; //存放找到的摆法
int anQueen[QueenNum];      //纪录当前正在尝试的摆法
int nFoundNum = 0;          //当前已经找到多少种摆法
void Queen(int n);          //摆放第n行以及以后的皇后(行号从0开始算)
int main(void)
{
    int n, b;
    Queen(0);
    scanf("%d", &n);
    while (n--)
    {
        scanf("%d", &b);
        for (int i = 0; i < QueenNum; i++)
            printf("%d", anResult[b - 1][i] + 1);
        printf("\n");
    }
    return 0;
}
//摆放第n行以及以后的皇后(行号从0开始算)
void Queen(int n)
{

    if (n == QueenNum)
    { //前QueenNum行都成功摆好了，记下摆法
        memcpy(anResult[nFoundNum++], anQueen, sizeof(anQueen));
        return;
    }
    for (int i = 0; i < QueenNum; i++)
    { //尝试第n行所有位置
        int j;
        for (j = 0; j < n; j++)
        {
            //对每个位置，判断是否和已经摆好的皇后冲突
            if (i == anQueen[j] ||
                abs(i - anQueen[j]) == abs(n - j))
                break;
        }
        if (j == n)
        {
            //如果没有冲突，则第n行摆好了，记下来，再摆第n+1行				
            anQueen[n] = i;
            Queen(n + 1);
        }
    }
}