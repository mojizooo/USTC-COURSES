//a个苹果，d个盘子，1 2 3 和 3 2 1为相同放法
#include <stdio.h>
int f(int a, int d)
{
    if (d == 1 || a == 0)
        return 1;
    if (d > a)
        return f(a, a);
        //盘子更多时，相当于a个苹果a个盘。
    return f(a, d - 1) + f(a - d, d);
    //有盘子空着的放法加上全不空的放法
}
int main()
{
    int apple, plate;
    scanf("%d %d", &apple, &plate);
    printf("%d", f(apple, plate));
}