#include <stdio.h>
#include <math.h>
void exp()
{
    char a[10];
    scanf("%s", a);
    switch (a[0])
    {
    case '+':
        printf("(");
        exp();
        printf("+");
        exp();
        printf(")");
        break;
    case '-':
        printf("(");
        exp();
        printf("-");
        exp();
        printf(")");
        break;
    case '*':
        printf("(");
        exp();
        printf("*");
        exp();
        printf(")");
        break;
    case '/':
        printf("(");
        exp();
        printf("/");
        exp();
        printf(")");
        break;
    default:
        printf("%s", a);
        return;
    }
}
int main()
{
    exp();
}