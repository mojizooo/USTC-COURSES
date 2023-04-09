/*
	输入：
	每行一个正整数，表示从2000.1.1开始逝去的天数 最后一行-1 
	输出：
	每个整数输出一行，代表对应日期和星期几
	YY-MM-DD DAY
*/

#include <stdio.h>
int type(int );

char week[7][10]={"Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};

int year[2]={365,366}; 
//year[0]表示非闰年的天数，year[1]表示闰年的天数。

int month[2][12]={31,28,31,30,31,30,31,31,30,31,30,31,
			31,29,31,30,31,30,31,31,30,31,30,31};
//month[0]表示非闰年里每个月的天数，month[1]表示闰年里每个月的天数。
int  main(void)
{  
	int days, dayofweek;
 //days 表示输入的天数，dayofweek表示星期几。
	int i = 0, j = 0;
	while (scanf("%d", &days) && days != -1) {
	    dayofweek = days % 7;
	    for(i = 2000; days >= year[type(i)]; i++)
		    days -= year[type(i)];
	    for(j = 0; days >= month[ type(i) ][ j ]; j++)
		    days -= month[ type(i) ][ j ];
	    printf("%d-%02d-%02d %s\n",
		 i, j + 1, days + 1, week[dayofweek]);
	}
	return 0;
}

int type(int m){ 

//判断第m年是否是闰年，是则返回1，否则返回0。
	if(m % 4 != 0 || (m % 100 == 0 && m % 400 != 0))		return  0;  //不是闰年
	else return 1;   // 是闰年
	
}
