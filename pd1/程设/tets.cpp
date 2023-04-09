#include "iostream"
#include "string.h"
const int N = 200010;
int find_1(char* num, int a, int b, int n)
{
    a < 0 ? a = 0 : 1;
    b >= n ? b = n - 1 : 1;
    for (int m = a; m <= b; m++)
    {
        if (num[m] == '1')
            return 1;
    }
    return 0;
}
int main()
{
    using namespace std;
    int t;
    char ch;
    char num[N] = {0};
    char copy[N] = { 0 };
    char* str = num;
    scanf("%d", &t);
    while (t--)
    {
        unsigned int i, j, n, k;
        int cnt = 0;
        scanf("%d %d", &n, &k);
        while ((ch = getchar()) == '\n') continue;
        do *str++ = ch; while ((ch = getchar()) != '\n');
        *str = '\0';//receive

        int max = 0;
        for (j = 0; j < n ; j++)
        {
            strncpy(copy, num, n);
            for (i = j; i < n; i += k + 1)
            {
                if (copy[i] == '0' && !find_1(copy, i - k, i + k, n)) {
                    cnt++;
                    copy[i] = '1';
                }
                if ((i + k + 1) > n - 1) {
                    i = n - 1;
                    if (copy[i] == '0' && !find_1(copy, i - k, n - 1, n))
                        cnt++;
                }
            }
            if(max < cnt) max = cnt;
            cnt = 0;
        }
        if (n == 1 && num[0] == '0') max = 1;
        printf("%d\n", max);
        str = num;
    }
    return 0;
}