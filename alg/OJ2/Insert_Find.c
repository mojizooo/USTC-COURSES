#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <memory.h>
#include <malloc.h>
typedef struct bitree
{
    long int id;
    char name[12];
    struct bitree *lchild;
    struct bitree *rchild;
} bitree, *binode;
binode insert(binode t, long int _id, char _name[])
{
    if (!t)
    {
        t = (binode)malloc(sizeof(bitree));
        t->id = _id;
        memcpy(t->name, _name, 12 * sizeof(char));
        t->lchild = t->rchild = NULL;
    }
    else
    {
        if (strcmp(t->name, _name) > 0)
        {
            t->lchild = insert(t->lchild, _id, _name);
        }
        else
        {
            t->rchild = insert(t->rchild, _id, _name);
        }
    }
    return t;
}
binode search(binode t, char _name[])
{
    if (t == NULL)
        return NULL;
    if (strcmp(t->name, _name) > 0)
        return search(t->lchild, _name);
    else if (strcmp(t->name, _name) < 0)
        return search(t->rchild, _name);
    else
        return t;
}
void pre(binode t)
{
    if (t)
    {
        puts(t->name);
        pre(t->lchild);
        pre(t->rchild);
    }
    else
        return;
}
int main()
{
    int i = 0;
    int flag;
    char *temp = (char *)malloc(sizeof(char) * 20);
    char *temp1 = (char *)malloc(sizeof(char) * 20);
    char *input = (char *)malloc(sizeof(char) * 100);
    long int id;
    char *name = (char *)malloc(sizeof(char) * 20);
    binode T = NULL;
    binode res = NULL;
    while (1)
    {
        memset(input, 0, sizeof(input));
        gets(input);
        if (input[0] == 'I')
        {
            sscanf(input, "%s %ld %s", temp, &id, name);
            T = insert(T, id, name);
        }
        else if (input[0] == 'F')
        {
            sscanf(input, "%s %s", temp, temp1);
            res = search(T, temp1);
            if (res == NULL)
                printf("-1\n");
            else
                printf("%ld\n", res->id);
        }
        else
            break;
    }
    return 0;
}