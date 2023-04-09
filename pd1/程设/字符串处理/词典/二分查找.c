#include <cstdio>
#include <cstring>
#include <cstdlib>
const int maxn = 100000 + 10;
struct node //节点的结构体
{
    char eng[12];
    char fore[12];
};
node dictionary[maxn]; //创建字典
int cmp(const void *a, const void *b)//实参可以是任何类型的指针，在实际函数中将其重新定义
{ //比较函数，用于qsort中，将字典按首字母顺序排序
    return strcmp(((node *)a)->fore, ((node *)b)->fore);
}
int search(const void *a, const void *b)//在后者中查找前者
{ //二分查找函数
    return strcmp((char *)a, ((node *)b)->fore);
}
int main()
{
    //freopen("1.txt","r",stdin);
    char english[30], forigen[20];
    int count = 0, flag;
    node *p;
    while (fgets(english, 29, stdin) && english[0] != '\n')//从键盘接受29个字符放在English中储存
    {
        sscanf(english, "%s%s", dictionary[count].eng, dictionary[count].fore);
        count++;
    }
    qsort(dictionary, count, sizeof(node), cmp);//将字典排序
    while (scanf("%s", forigen) != EOF)
    {
        p = NULL;
        p = (node *)bsearch(forigen, dictionary, count, sizeof(node), search);//bsearch函数返回指针
        if (p)//如果不是空指针
            printf("%s\n", p->eng);
        else
            printf("eh\n");
    }
    return 0;
}