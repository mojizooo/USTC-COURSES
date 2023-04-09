#include <stdio.h>
#include <stdlib.h>
int alice[1000000] = {0};
int bob[1000000] = {0};
int res[1000000] = {0};
int cmp(const void *a, const void *b)
{
    return *(int *)a - *(int *)b;
}
int main()
{
    int n, m;
    scanf("%d%d", &n, &m);
    int count = 0;
    int temp;
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &temp);
        alice[i] = temp;
    }
    qsort(alice, n, sizeof(int), cmp);
    for (int i = 0; i < m; i++)
    {
        scanf("%d", &temp);
        bob[i] = temp;
    }
    qsort(bob, m, sizeof(int), cmp);
    for (int i = 0, j = 0; i < n && j < m;)
    {
        if (alice[i] == bob[j])
        {
            res[count] = alice[i];
            count++;
            i++;
            j++;
            continue;
        }
        if (alice[i] < bob[j])
        {
            i++;
        }
        else
        {
            j++;
        }
    }
    if (count == 0)
        printf("-1");
    else
    {
        qsort(res, count, sizeof(int), cmp);
        temp = -1;
        for (int i = 0; i < count; i++)
        {
            if (res[i] == temp)
            {
                continue;
            }
            else
            {
                temp = res[i];
                printf("%d ", res[i]);
            }
        }
    }
    return 0;
}