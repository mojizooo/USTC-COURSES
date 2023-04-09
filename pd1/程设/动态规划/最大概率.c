#include <stdio.h>
int num[110][3];
/*
  本题思路：
  将数据的输入储存在两列中，如输入1 2 3 4 5 6，储存情况为
  1 2
  3 4
  5 6
  由于相邻数不能相加，则第一列的数仅有与其下一排两列中的较大数相加的方式，
  第二列的数仅有与其下一排第二列以及其下两排第一列中较大数相加的方式。
  如2只需选择3,4之间较大数，选择5,6必可以额外选择3,4。
  采用动态规划从下往上累加。
*/
int max(int a, int b)//最大值判断函数
{
    return a > b ? a : b;
}
int main(int argc, char const *argv[])
{
    int i = 1, j = 1;                //行列的输入控制
    int row;
    while (j <= 2)
    {   //输入数据
        scanf("%d", &num[i][j]);
        if (j == 2)
        {
            j = 1;
            i++;
        }
        else
            j = 2;
        if (getchar() == EOF) //控制结束
            break;
    }
    row = i;
    for (i = row - 1; i >= 1; i--)
    {   //从最低层开始向上累加
        num[i][1] += max(num[i + 1][1], num[i + 1][2]);
        num[i][2] += max(num[i + 2][1], num[i + 1][2]);
    }
    printf("%d", max(num[1][1], num[1][2])); //输出最终两种结果中较大者
    return 0;
}