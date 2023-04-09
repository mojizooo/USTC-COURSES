#include <iostream>
#include <cstring>
#include <cctype>
using namespace std;
double factor_value();
double term_value();
double expression_value();
int main()
{
    cout << "Enter an expression: ";
    cout << "The result is " << expression_value() << endl;
}
double expression_value()
{                                 //求一个表达式的值
    double result = term_value(); //求第一项的值
    bool more = true;
    while (more)
    {
        char op = cin.peek(); //从cin流中看一个
                              //字符，但不取出
        if (op == '+' || op == '-')
        {
            cin.get();
            int value = term_value();
            if (op == '+')
                result += value;
            else
                result -= value;
        }
        else
            more = false;
    }
    return result;
}
double term_value() //求一个项的值
{
    double result = factor_value(); //求第一个因子的值
    bool more = true;
    while (more)
    {
        char op = cin.peek();
        if (op == '*' || op == '/')
        {
            cin.get();
            int value = factor_value();
            if (op == '*')
                result *= value;
            else
                result /= value;
        }
        else
            more = false;
    }
    return result;
}
double factor_value() //求一个因子的值
{
    double result = 0;
    char c = cin.peek();
    if (c == '(')
    {
        cin.get();
        result = expression_value();
        cin.get();
    }
    else
    {
        while (isdigit(c))
        {
            result = 10 * result + c - '0';
            cin.get();
            c = cin.peek();
        }
    }
    return result;
}