#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char *num;    //储存数据输入 
char target[11]; //储存排列的输出
int max_len;  //储存数据项数
void output(char *arr, int pos)
{   /*
      arr储存当前正在进行排列的数据
      pos储存当前首先排列的数据所处的位置
    */
    int len = strlen(arr);               //len储存当前正在排列的数据个数
    target[max_len - len] = *(arr + pos);//将pos位置的首先排列的数据放进目标字符串
    if (1 == len)
    {   //如果这是最后一个数据，输出排列，结束循环
        puts(target);
        return;
    }
    char *temp;                                   //临时存放排除掉已排列数据的剩余数据 
    temp = (char *)malloc(10 * sizeof(char));
    memcpy(temp, arr, 10);
    memcpy(temp + pos, temp + pos + 1, len - pos);//除掉目标数据
    temp[len] = 0;                                //多余位初始化
    for (int i = 0; i < len - 1; i++)
    {   //按从小到大顺序继续处理剩余数据
        output(temp, i);
    }
    free(temp);
}
int main(int argc, char const *argv[])
{
    num = (char *)malloc(10 * sizeof(char));
    memset(num, 0, 10);//初始化
    int i = 0;
    while (1)
    {   //输入函数
        scanf("%c", num + i);
        i++;
        if (getchar() == EOF) //控制结束
            break;
    }
    max_len = strlen(num);    
    for (i = 0; i < max_len; i++)
    {   //按从小到大顺序输出排列
        output(num, i);
    }
    free(num);
    return 0;
}