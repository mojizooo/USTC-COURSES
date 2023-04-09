#include <stdio.h>
int main()
{
    int len;
    int temp;
    int res = 0;
    scanf("%d", &len);
    for (int i = 0; i <= len; i++)
    {
        res = res ^ i;
    }
    for (int i = 0; i < len; i++)
    {
        scanf("%d", &temp);
        res = res ^ temp;
    }
    printf("%d", res);
    return 0;
}