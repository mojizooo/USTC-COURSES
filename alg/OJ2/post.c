#include <stdio.h>
#include <memory.h>
#include <malloc.h>
int pre[100002];
int mid[100002];
int count;
void post(int len, int pre_, int mid_, int count)
{
    if (!len)
        return;
    int i = 0;
    for (i; i < len; i++)
        if (mid[mid_ + i] == pre[pre_])
            break;
    post(i, pre_ + 1, mid_, count);
    post(len - i - 1, pre_ + i + 1, mid_ + i + 1, count);
    if (count == 0)
    {
        printf("%d", pre[pre_]);
    }
    else
    {
        printf("%d ", pre[pre_]);
        count--;
    }
}
int main()
{
    int len;
    scanf("%d", &len);
    for (int i = 0; i < len; i++)
    {
        scanf("%d", &pre[i]);
    }
    for (int i = 0; i < len; i++)
    {
        scanf("%d", &mid[i]);
    }
    post(len, 0, 0, len);
}