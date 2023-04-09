#include <stdio.h>
#include <stdlib.h>
long long int max(long long int a, long long int b)
{
    return a > b ? a : b;
}
int main()
{
    int n;
    long int temp2;
    long int temp1;
    scanf("%d", &n);
    scanf("%lld", &temp1);
    long long int res = temp1;
    for (int i = 1; i < n; i++)
    {
        scanf("%lld", &temp2);
        temp1 = max(0, temp1) + temp2;
        res = max(res, temp1);
    }
    printf("%lld", res);
}