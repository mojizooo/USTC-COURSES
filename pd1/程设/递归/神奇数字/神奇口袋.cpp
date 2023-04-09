#include <stdio.h>
int numbers[50], n;
int count(int ith, int sum)
{
    if (sum == 0)
        return 1;
    if (ith == n || sum < 0)
        return 0;
    return count(ith + 1, sum - numbers[ith]) + count(ith + 1, sum);
    //分为使用numbers[ith]和不使用numbers[ith]
}
