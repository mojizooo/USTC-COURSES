#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int check(char *a,char *b) {//查找函数
    int count = 0;
    if (strstr(b, a)) {      //若未能查找到，结束递归
        count++;           
        b = strstr(b, a) + 1;//将被查找的指针向前推一位
        count += check(a, b);//递归调用check函数
    }
    return count;
}
int main() {
    char *ans;   //用于存放查找的元素
    char *target;//用于存放被查找的字符串
    ans = (char *)malloc(51 * sizeof(char));
    target = (char *)malloc(51 * sizeof(char));//赋予空间
    scanf("%[^\n]%*c", ans);                   //读入字符串同时消化掉最后一个换行符
    while(scanf("%[^\n]%*c", target) == 1){
        printf("%d", check(ans, target));
        putchar(10);
    }
    return 0;
}