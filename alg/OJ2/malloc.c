#include <stdio.h>
#include <string.h>
#include <stdlib.h>
typedef struct bitree
{
    int ledge;
    int redge;
    struct bitree *lchild;
    struct bitree *rchild;
} bitree, *binode;
int flag;
int match(binode t, int left, int right)
{
    if (left > t->redge)
        return 1;
    if (right < t->ledge)
        return -1;
    return 0;
}
binode insert(binode t, int left, int right)
{
    if (!t)
    {
        t = (binode)malloc(sizeof(bitree));
        t->ledge = left;
        t->redge = right;
        t->lchild = t->rchild = NULL;
        puts("0");
    }
    else
    {
        int res = match(t, left, right);
        if (res > 0)
        {
            t->rchild = insert(t->rchild, left, right);
        }
        else if (res < 0)
        {
            t->lchild = insert(t->lchild, left, right);
        }
        else
        {
            puts("-1");
            return t;
        }
    }
    return t;
}
int main()
{
    int num;
    int left, right;
    scanf("%d", &num);
    binode T = NULL;
    for (int i = 0; i < num; i++)
    {
        scanf("%d %d", &left, &right);
        T = insert(T, left, right);
    }
}