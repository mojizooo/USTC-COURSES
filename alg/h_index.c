#include <stdio.h>
#include <stdlib.h>
int a[10000] = {0};
int cmp(const void *a, const void *b)
{
    return *(int *)a - *(int *)b;
}
int main()
{
    int num;
    int temp;
    int res = 0;
    scanf("%d", &num);
    for (int i = 0; i < num; i++)
    {
        scanf("%d", &temp);
        a[i] = temp;
    }
    qsort(a, num, sizeof(int), cmp);
    for (int i = 0; i < num; i++)
    {
        if ((num - i) >= a[i])
        {
            if (a[i] > res)
                res = a[i];
        }
    }
    printf("%d", res);
    return 0;
}