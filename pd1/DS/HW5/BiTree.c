#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int N;
typedef struct BiTNode
{
    char data;
    struct BiTNode *lchild, *rchild;
} BiTNode, *BiTree;

void init_bitree(BiTree t)
{
    t = (BiTree)malloc(sizeof(BiTNode));
}
BiTree CreatBiTree()
{
    BiTree t;
    //if(N < 0) return t;
    char tmp;
    scanf("%c", &tmp);
    if (tmp == '#')
        t = NULL;
    else
    {
        t = (BiTree)malloc(sizeof(BiTNode));
        t->data = tmp;
        //N--;
        //putchar(t->data);
        t->lchild = CreatBiTree();
        t->rchild = CreatBiTree();
    }
    return t;
}

void PreVisit(BiTree t)
{
    if (t)
    {
        printf("now is %c\n", t->data);
        PreVisit(t->lchild);
        PreVisit(t->rchild);
    }
    else puts("false");
}

BiTree FreeBitree(BiTree t){
    if(t){
        FreeBitree(t->lchild);
        FreeBitree(t->rchild); 
        free(t);
        t = NULL;
    }
    return t;
}

BiTree Del_x(BiTree t, char x){
    if(t){
        if(t->data == x){
            t = FreeBitree(t);
        }
        else {
            t->lchild = Del_x(t->lchild, x);
            t->rchild = Del_x(t->rchild, x);
        }
    }
    return t;
}

int main()
{
    BiTree T;
    //scanf("%d", &N);
    T = CreatBiTree();
    T = Del_x(T, '2');
    PreVisit(T);
}