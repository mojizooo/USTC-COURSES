#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct node
{
    struct node *next[26];
    char word[15];
}node;

char str[25], str1[15], str2[15];//str用于输入，str1为词典前半部分，str2为词典后半部分
node *head;//头指针

void dictionary()//创建字典
{
    node *p, *q = head;
    int i, j, k, len;
    len = strlen(str2);
    for (i = 0; i < len - 1; i++)
    {
        k = str2[i] - 'a';//不同字母对应相应位置的指针
        if (q->next[k] == NULL)
        {
            p = (node *)malloc(sizeof(node));
            q->next[k] = p;
            p->word[0] = 0;//做标记
            for (j = 0; j < 26; j++)
                p->next[j] = NULL;
            q = p;
        }
        else q = q->next[k];//如有相同字母，则直接向下
    }
    k = str2[i] - 'a';//最后一个字符
    if (q->next[k] == NULL)
    {
        p = (node *)malloc(sizeof(node));
        q->next[k] = p;
        strcpy(p->word, str1);//将译文录入进最后一个节点，同时其他节点均有相同特征
        for (j = 0; j < 26; j++)
            p->next[j] = NULL;
    }
    else
    {
        q = q->next[k];
        strcpy(q->word, str1);
    }
}

void search()
{
    node *p = head;
    int i, k, len;
    len = strlen(str);
    for (i = 0; i < len - 1; i++)
    {
        k = str[i] - 'a';
        if (p->next[k] == NULL)
        {
            puts("eh");
            break;
        }
        else p = p->next[k];
    }
    if (i == len - 1)
    {
        k = str[i] - 'a';
        if (p->next[k] == NULL) puts("eh");
        else
        {
            p = p->next[k];
            if (p->word[0] == 0) puts("eh");
            else puts(p->word);
        }
    }
}

int main()
{
    int i;
    head = (node *)malloc(sizeof(node));
    for (i = 0; i < 26; i++)
        head->next[i] = NULL;
    while (1)
    {
        gets(str);
        if (strcmp(str, "") == 0) break;
        else
        {
            sscanf(str, "%s %s", str1, str2);
            dictionary();
        }
    }
    while (scanf("%s",str) != EOF)
        search();
    return 0;
}