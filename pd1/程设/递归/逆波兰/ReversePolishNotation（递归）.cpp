/*
 * 主要思想：
 *
 * 逆波兰式（Reverse Polish Notation，下面简称RPN）的归纳定义为：
 * 1. 操作数0、1、2、3、4、5、6、7、8、9是RPN，
 *    +、-、*、/为运算符（Operator）。
 * 2. 如果a是RPN，b是RPN，那么 a b Operator也是RPN。
 * 3. 除了有限次使用1、2构造的RPN外，在也没有其他RPN。
 * 
 * 那么只需要从后向前读取输入的RPN，遇到Operator就向前读取两个RPN
 * 并将Operator置于他们之间即可得到转化后的中缀表达式（Infix Notation）
 *
 */

#include <iostream>
#include <stdlib.h>
#include <string.h>
using namespace std;

char *pCurrentPos; //当前读取字符的地址

typedef struct SInfixNotation
{
    /*
     * 中缀表达式（Infix Notation，IN）结构体。
     * 成员：
     * strNotation  - IN的表达式
     * nStatus      - IN的优先级（+、-为0，*、/为1，操作数为2）
     */
    string strNotation;
    int nStatus;
} IN;

IN Rpn2In()
{
    /*
     * Rpn2In()：将pCurrentPos之前的逆波兰式（RPN）转化为中缀表达式（IN）
     *
     * 返回一个SInfixNotation，其中strNotation为中缀表达式本身，
     * nStatus为表达式的优先级
     * 
     */
    char cOp; //pCurrentPos指向的运算符/操作数
    IN SResult = {"", 0}, STemp = {"", 0};
    // STemp - 临时结构体
    switch (cOp = *pCurrentPos--) //读取后pCurrentPos向前移一位
    {
    /*
     * 表达式优先级：
     *  0：加法、减法
     *  1：乘法、除法
     *  2：操作数
     */
        case '+':
            SResult.nStatus = 0;
            cOp = '+';
            break;
        case '-':
            SResult.nStatus = 0;
            cOp = '-';
            break;
        case '*':
            SResult.nStatus = 1;
            cOp = '*';
            break;
        case '/':
            SResult.nStatus = 1;
            cOp = '/';
            break;
        default: //读取到的是操作数
            SResult.nStatus = 2;
            SResult.strNotation = cOp;
            return SResult;
    }
    //递归地向前转化两个RPN，并用运算符连接起来
    STemp = Rpn2In();
    if (STemp.nStatus > SResult.nStatus)
        //后表达式优先级比本表达式更高，不需要括号
        SResult.strNotation = STemp.strNotation;
    else
        SResult.strNotation = "(" + STemp.strNotation + ")";

    STemp = Rpn2In();
    if (STemp.nStatus < SResult.nStatus)
        //前表达式优先级比本表达式更低，需要括号
        SResult.strNotation = "(" + STemp.strNotation + ")" + cOp + SResult.strNotation;
    else
        SResult.strNotation = STemp.strNotation + cOp + SResult.strNotation;
    return SResult;
}

int main()
{
    string strLine = ""; //每行输入的字符串
    char *szRpn = NULL;  //每行输入的RPN，由strLine转化而来
    int nLength = 0;     //strLine的长度

    cin >> strLine;
    nLength = strLine.length();
    //strLine转入szRpn中
    szRpn = (char *)malloc((nLength + 1) * sizeof(char));
    strcpy(szRpn, strLine.c_str());
    *(szRpn + nLength) = 0;
    //起始位置设为szRpn[nLength - 1]
    pCurrentPos = szRpn + nLength - 1;

    cout << Rpn2In().strNotation << endl;
    free(szRpn); //释放内存
    return 0;
}
