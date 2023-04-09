#include <stdio.h>
int min(int a, int b)
{
    return a < b ? a : b;
}
int main()
{
    int n, m;
    int f = 0;
    int temp;
    scanf("%d %d", &n, &m);
    int a[2][m];
    for (int i = 0; i < m; i++)
    {
        scanf("%d", &temp);
        if (i != 0)
            a[f][i] = a[f][i - 1] + temp;
        else
            a[f][i] = temp;
    }
    f = 1;
    for (int i = 1; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            scanf("%d", &temp);
            if (!j)
            {
                a[f][j] = a[1 - f][j] + temp;
            }
            else
            {
                a[f][j] = min(a[1 - f][j], a[f][j - 1]) + temp;
            }
        }
        f = 1 - f;
    }
    printf("%d", n % 2 ? a[0][m - 1] : a[1][m - 1]);
}