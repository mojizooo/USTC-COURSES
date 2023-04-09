#include <stdio.h>
#include <stdlib.h>
int a[1000000] = {0};
int merged[1000000] = {0};
int res;
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
            if (a[i] > a[j])
            {
                merged[k] = a[j];
                k++;
                j++;
                res += mid - i + 1;
            }
            else
            {
                merged[k] = a[i];
                k++;
                i++;
            }
        }
        for (i; i <= mid; i++)
        {
            merged[k++] = a[i];
        }
        for (j; j <= right; j++)
        {
            merged[k++] = a[j];
        }
        for (i = left; i <= right; i++)
        {
            a[i] = merged[i];
        }
    }
}
int main()
{
    int len;
    scanf("%d", &len);
    for (int i = 1; i <= len; i++)
    {
        scanf("%d", &a[i]);
    }
    merge_sort(1, len);
    printf("%d", res % 10000007);
}