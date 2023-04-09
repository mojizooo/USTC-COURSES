#include <stdio.h>
#include <stdlib.h>
int a[1000002] = {0};
typedef struct
{
    /* data */
    int times;
    int values;
} ele;
ele res[1000002];
ele merged[1000002];
int cmp_int(const void *a, const void *b)
{
    return *(int *)a - *(int *)b;
}
void merge_sort(int left, int right)
{
    if (left >= right)
        return;
    else
    {
        int mid = (left + right) / 2;
        merge_sort(left, mid);
        merge_sort(mid + 1, right);
        int k = left;
        int i, j;
        for (i = left, j = mid + 1; i <= mid && j <= right;)
        {
            if (res[i].times > res[j].times)
            {
                merged[k] = res[j];
                k++;
                j++;
            }
            else
            {
                merged[k] = res[i];
                k++;
                i++;
            }
        }
        for (i; i <= mid; i++)
        {
            merged[k++] = res[i];
        }
        for (j; j <= right; j++)
        {
            merged[k++] = res[j];
        }
        for (i = left; i <= right; i++)
        {
            res[i] = merged[i];
        }
    }
}
int main()
{
    int len;
    scanf("%d", &len);
    for (int i = 0; i < len; i++)
    {
        scanf("%d", &a[i]);
    }
    qsort(a, len, sizeof(int), cmp_int);
    int temp = 1000000001;
    int count = 0;
    for (int i = 0; i < len; i++)
    {
        if (temp != a[i])
        {
            count++;
            res[count].values = a[i];
            res[count].times++;
            temp = a[i];
        }
        else
        {
            res[count].times++;
        }
    }
    merge_sort(1, count);
    for (int i = 0; i <= count; i++)
        for (int j = 0; j < res[i].times; j++)
            printf("%d ", res[i].values);
}