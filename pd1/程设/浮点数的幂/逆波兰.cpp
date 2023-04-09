#include <stdio.h>
#include <math.h>
double exp()
{
    char a[10];
    scanf("%s", a);
    switch (a[0])
    {
    case '+':
        return exp() + exp();
    case '-':
        return exp() - exp();
    case '*':
        return exp() * exp();
    case '/':
        return exp() / exp();
    default:
        return atof(a);
    }
}
int main()
{
    double ans;
    ans = exp();
    printf("%f", ans);
    return 0;
}