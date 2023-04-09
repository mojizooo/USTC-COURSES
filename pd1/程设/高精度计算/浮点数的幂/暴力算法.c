#include <stdio.h>
#include <string.h>
int main()
{
    char an[61] = "";//存放底数
    int n;           //存放指数
    while (scanf("%s %2d", an, &n) == 2)//接受指数和底数
    {
        int i = 0, record = 0, j, judge = 1, bzero, fzero;//record记录小数点位置
        for (; i < 6; i++)                                //judge判断底数是否小于1，若judge为1则真
        {                                                 //bezro为result数组中前面的连续0结束位置，fzero为后者
            if (an[i] > '0')
                judge = 0;
            if (an[i] == '.')
            {
                if (i == 0)
                    judge = 1;
                record = i;//记录
                for (j = i; j < 5; j++)
                {
                    an[j] = an[j + 1];//去掉小数点
                }
                an[j] = '\0';
                break;
            }
        }
        int an1[7] = {0};//将底数字符串存入整型数组
        unsigned result[61] = {0};//存放最终结果
        unsigned Result[61] = {0};//临时存放结果
        for (i = 4, j = 0; i >= 0; i--)//本应为i=strlen(an)-1，但由于题目限制，此处可直接固定为4
        {
            result[j] = an[i] - '0';
            an1[j++] = an[i] - '0';
        }
        int l = 5;//l用于计算结果位数
        for (i = 1; i < n; i++)
        {
            for (j = 0; j < 5; j++, l++)
            {
                for (int k = 0; k < l; k++)
                {
                    Result[k + j] += an1[j] * result[k];//整数高精度乘法
                }
            }
            for (int k = 0; k < l; k++)
            {
                if (Result[k] >= 10)
                {
                    if (k == l - 1)
                        l++;//位数加一
                    Result[k + 1] += Result[k] / 10;
                    Result[k] %= 10;//进位处理
                }
                result[k] = Result[k];//更新最终结果数据
                Result[k] = 0;//重置临时结果
            }
        }
        fzero = l;
        while (0 == result[fzero])
            --fzero;//计算最高位连续0结束位置
        bzero = 0;
        while (0 == result[bzero])
            ++bzero;//计算最低位连续0结束位置
        if (judge)//如果底数小于1
            for (j = n * (5 - record) - 1; j >= bzero; j--)//n*(5-record)-1为去除小数点的总位数
            {
                if (j == n * (5 - record) - 1 && j != bzero)//防止输出两个小数点
                {
                    putchar('.');
                }
                if (j > fzero)//给出前导0
                {
                    putchar('0');
                    continue;
                }
                if (n == 1 && bzero == fzero && j == n * (5 - record) - 1)
                    putchar('.');//特殊处理.1情况
                printf("%d", result[j]);
            }

        else//底数大于1情况
            for (j = fzero; j >= (bzero > (5 - record) * n ? (5 - record) * n : bzero); j--)//特殊处理整十情况
            {
                printf("%d", result[j]);
                if (j == (5 - record) * n && bzero < (5 - record) * n)//防止出现10.情况
                    putchar('.');
            }
        putchar('\n');
    }
    return 0;
}