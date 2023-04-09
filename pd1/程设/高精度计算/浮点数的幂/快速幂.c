#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_FLOAT_LEN 5

int* Pow(int *f, int n, int len);//幂次方函数，返回一个数组，第一位为结果的长度，之后为结果

int* multiply(int *f1, int *f2, int len1, int len2);//高精乘法，返回一个数组，第一位为结果的长度，之后为结果

int main(void){
    char szLine[MAX_FLOAT_LEN + 1];
    int aFloat[MAX_FLOAT_LEN + 1], *aResult; 
    int n, isPre0, nPresentPos, nDotPos, nFloatLen, nHighestPos;
    //nPresentPos为输入时当前是第几最高位
    //nDotPos为小数点位置，0.123的nDotPos=3
    //nFloatLen为浮点数的有效位数，0.0120的nFloatLen=2
    char cTmp;
    while((cTmp = getchar()) != EOF){
        ungetc(cTmp, stdin);
        //初始化数据
        n = nPresentPos = nDotPos = nFloatLen = nHighestPos = 0;
        isPre0 = 1;

        //初始化szLine, aFloat, aResult
        memset( szLine, 0, sizeof(szLine));
        memset( aFloat, 0, sizeof(aFloat));

        //输入浮点数存入szLine中，并去掉前导0和后导0
        for(int i = 0; i < MAX_FLOAT_LEN + 1; i++){
            cTmp = getchar();
            nDotPos++;
            if(isPre0 == 1){
                if(cTmp == '0') 
                    continue;
                else if(cTmp == '.') {
                    nDotPos = 0;
                    continue;
                }
                else 
                    isPre0 = 0;
            }
            if(cTmp == '.'){
                nDotPos = 0;
                continue;
            }
            szLine[nPresentPos] = cTmp;
            nPresentPos++;
        }
        nFloatLen = strlen(szLine);
        while(szLine[nFloatLen - 1] == '0' && nDotPos != 0){//除去后导0
            szLine[nFloatLen - 1] = 0;
            nFloatLen--;
            nDotPos--;
        }

        //将浮点数转入aFloat中，aFloat[0]作为个位
        for(int i = 0; i < nFloatLen; i++){
            aFloat[i] = szLine[nFloatLen - i - 1] - '0';
        }

        scanf("%d", &n);
        getchar();

        aResult = Pow(aFloat, n, nFloatLen);
        nHighestPos = *aResult;
        nDotPos *= n;
        if (nDotPos == 0){
            for(int i = 0; i < nHighestPos; i++){
                putchar(aResult[nHighestPos - i] + '0');
            }
        }
        else if(nHighestPos <= nDotPos){
            putchar('.');
            for(int i = nHighestPos; i < nDotPos; i++){
                putchar('0');
            }
            for(int i = 0; i < nHighestPos; i ++){
                putchar(aResult[nHighestPos - i] + '0');
            }
        }
        else{
            for(int i = 0; i < nHighestPos - nDotPos; i++)
                putchar(aResult[nHighestPos - i] + '0');
            putchar('.');
            for(int i = 0; i < nDotPos; i++)
                putchar(aResult[nDotPos - i] + '0');
        }
        putchar(10);
        free(aResult);
    }
    return 0;
}

int* Pow(int *aF, int n, int nLen) {
    int *aRes;
    if(n == 1){
        aRes = (int*)malloc((nLen + 1)*sizeof(int));
        for(int i = 0; i < nLen; i ++)
            *(aRes + 1 + i) = *(aF + i);
        *aRes = nLen;
        return aRes;
    }
    /*else if(n == 2){
        aRes = multiply(aF, aF, nLen, nLen);
        return aRes;
    }
    else if(n % 2 == 0){
        int *aTmp = Pow(aF, n/2, nLen);
        aRes = multiply(aTmp + 1, aTmp + 1, *aTmp, *aTmp);
        free(aTmp);
        return aRes;
    }*/
    if(n & 1){
        int *aTmp1 = Pow(aF, n>>1, nLen);
        int *aTmp2 = multiply(aTmp1 + 1, aTmp1 + 1, *aTmp1, *aTmp1);
        free(aTmp1);
        aRes = multiply(aTmp2 + 1, aF, *aTmp2, nLen);
        free(aTmp2);
        return aRes;
    }
    aRes = multiply(aF, aF, nLen, nLen);
    return Pow(aRes+1, n>>1, *aRes);
}

int* multiply(int *af1, int *af2, int nLen1, int nLen2) {
    int * aRes = (int *)malloc((nLen1 + nLen2 + 1) * sizeof(int));
    int * aMultiplied = aRes + 1;
    memset( aRes, 0, (nLen1 + nLen2 + 1) * sizeof(int));
    for(int i = 0;i < nLen2; i ++ ) {               
        //用选定的an1的那一位，去乘an2的各位 
        for(int j = 0; j < nLen1; j ++ )            
            //两数第i, j位相乘，累加到结果的第i+j位
            aMultiplied[i+j] += af2[i]*af1[j];  
    }
    //下面的循环统一处理进位问题
    for( int i = 0; i < nLen1 + nLen2; i ++ )   {
        if( aMultiplied[i] >= 10 ) {
            aMultiplied[i+1] += aMultiplied[i] / 10;
            aMultiplied[i] %= 10;
        }
        if( aMultiplied[i] )    *aRes = i + 1;
    }
    return aRes;
}