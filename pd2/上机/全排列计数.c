#include <stdio.h>
#include<stdlib.h>
#include <string.h>
char *num;
char *a;
int len;
int sum=0;
int m;
int flag=0;
void search(char *s,int n,int x){
    if(flag) return;
    a[len-n]=*(s+x);
    if(1==n){
        ++sum;
        if(sum==m) puts(a),flag=1;
        return ;
    }
    char *b;
    b=(char*)malloc(10*sizeof(char));
    memcpy(b,s,10);
    memcpy(b+x,b+x+1,n-x);
    b[n]=0;
    for(int i=0;i<=n-2;i++){
        search(b,n-1,i);
    }
}
int main(int argc, char const *argv[])
{
    num=(char *)malloc(10*sizeof(char));
    memset(num,0,10);
    int n;
    scanf("%d %d",&n,&m);
    for(int i=0;i<n;i++)
        num[i]=i+49;
    len=strlen(num);
    a=(char*)malloc(10*sizeof(char));
    memset(a,0,10);
    for(int i=0;i<len;i++){
        if(flag) {
            free(a);
            free(num);
            return 0;
        }
        search(num,len,i);
        memset(a,0,10);
    }
}