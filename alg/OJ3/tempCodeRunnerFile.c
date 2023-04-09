#include <stdio.h>
#include <stdlib.h>
long int a[100001];
long long int max(long int a, long int b)
{
    return a > b ? a : b;
}
int main()
{
    int n;
    long int temp;
    scanf("%d", &n);
    scanf("%d", &a[0]);
    long long int res = a[0];
    for (int i = 1; i < n; i++)
    {
        scanf("%d", &temp);
        a[i] = max(0, a[i - 1]) + temp;
        res = max(res, a[i]);
    }
    printf("%lld", res);
}