/*
    输入：
    包括多个数据集合。每个数据集合的第一行是两个整数W和H，分别表示x方向和y方向瓷砖的数量。W和H都不超过20。在接下来的H行中，每行包括W个字符。每个字符表示一块瓷砖的颜色，规则如下：
    '.'为黑色，'#'为红色，'@'为起始点
    读入两个0时结束
    输出：
    从@出发能到达的瓷砖数
*/
#include <iostream>
using namespace std;
const int MAX 22
    //方块四周加红色块，去掉边界判断，
    //使得递归统一终止于红色块
    char rect[MAX][MAX];
    //返回从某点出发能走到的格子数
int walkFrom(int currentRow, int currentCol);
int main()
{
    　int col, row;
    　while (cin >> col >> row, col != 0 && row != 0)
    {
        　　int i, j, startRow, startCol;
        　　for (i = 0; i < MAX; i++)　 for (j = 0; j < MAX; j++) 　
　　　　rect[i][j] = '#';
        　　for (i = 1; i <= row; i++) 　 for (j = 1; j <= col; j++)
        {
            　
　　　　 cin >> rect[i][j];
            　　　　 if (rect[i][j] == '@')
            {
                　　　　　　startRow = i;
                　　　　　　startCol = j;
                　　　　　　rect[i][j] =‘.’;
                　 //人站立处是黑砖
　　　　
            }
            　　
        }
        　　cout << walkFrom(startRow, startCol) << endl;
        　
    } //while
}
int walkFrom(int currentRow, int currentCol)
{
    if (rect[currentRow][currentCol] == '#')
        return 0;
    else
        //本瓷砖算走过，以后不能再走了
        rect[currentRow][currentCol] = '#';

    return 1 + walkFrom(currentRow + 1, currentCol) + walkFrom(currentRow - 1, currentCol) + walkFrom(currentRow, currentCol + 1) + walkFrom(currentRow, currentCol - 1);
}
