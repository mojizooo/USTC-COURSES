#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#define test(A) ((A)<0 ? 0 : A)
char Map[400][400]={0};
int dx[4]={0,-1,0,1},dy[4]={-1,0,1,0};
int row,line;
int sum;
int classroom[3000];
void walkFrom(int currentRow, int currentCol, char n)
{
    ++sum;
    if(n>255) Map[currentRow][currentCol]=n;
	for(int i=0;i<4;i++){
        int tx=currentRow+dx[i],ty=currentCol+dy[i];
        if(tx>0&&ty>0&&(tx<=2*row-1)&&(ty<=2*line-1)&&!Map[tx][ty]){
            if(!Map[tx+dx[i]][ty+dy[i]]){
            walkFrom(tx+dx[i],ty+dy[i],n);
        }
    }
}
}
char * itobs(int num, char * str) {
    int i;
    for (i = 0; i <= 3; i++, num >>= 1) {
        str[i] = (01 & num) + '0';
    }
    return str;
}
int max(int a,int b){
	return a>b ? a : b;
}
int main(int argc, char const *argv[])
{
	int Max=0;
    int m=1;
	int i,j,i_1=1,j_1=1;
	char *str;
    int z1,z2;
    char z3;
    char z[5]="WNES";
	str=(char *)malloc(5*sizeof(char));
	scanf("%d %d",&line,&row);
	for(i=1;i<=row;i++){
		for(j=1;j<=line;j++){
            int x;
			scanf("%d",&x);
			str=itobs(x,str);
			for(int k=0;k<4;k++){
				if(str[k]=='1'&&k==0) Map[i_1][j_1-1]='#';
				if(str[k]=='1'&&k==1) Map[i_1-1][j_1]='#';
				if(str[k]=='1'&&k==2) Map[i_1][j_1+1]='#';
				if(str[k]=='1'&&k==3) Map[i_1+1][j_1]='#';
			}
			j_1+=2;
		}
		i_1+=2;
		j_1=1;
    }
    for(i=0;i<2*row;i++){
        for(j=0;j<2*line;j++) printf("%c", Map[i][j]);
        putchar('\n');
    }
    for(i=1;i<=2*row-1;i+=2)
    	for(j=1;j<=line*2-1;j+=2)
    		if(!Map[i][j]) {
    			walkFrom(i,j,m);
                classroom[m]=sum;
                sum=0;
    			//if(!classroom[m]) classroom[m]=1;
                Max=max(classroom[m],Max);
                m++;
    }
    for(i=0;i<2*row;i++){
        for(j=0;j<2*line;j++) printf("%c", Map[i][j]);
        putchar('\n');
    }
    for(i=0;i<m;i++) printf("%d\n", classroom[i]);
    printf("%d\n%d\n",m-1,Max);
    for(i=0;i<m;i++) if(classroom[i]==328) printf("%d\n",i );
    classroom[0]=0;
    Max=0;
    for(j=1;j<=2*line-1;j+=2)
        for(i=2*row-1;i>=1;i-=2){
            for(int k=1;k<=2;k++){
                int tx=i+dx[k],ty=j+dy[k];
                if(Map[tx][ty]&&tx>0&&ty>0){
                    int ans = classroom[Map[tx+dx[k]][ty+dy[k]]] + classroom[Map[i][j]];
                    printf("%d %d\n",Map[tx+dx[k]][ty+dy[k]] ,Map[i][j]);
                    if(ans>Max && Map[tx+dx[k]][ty+dy[k]]!=Map[i][j]){
                        Max=ans;
                        printf("%d\n%2d%2d\n", Max,i,j);
                        z1=i;
                        z2=j;
                        z3=z[k];
                    }
                }
            }
        }
    printf("%d %d\n",classroom[Map[73][35]],classroom[Map[71][35]]);
    printf("%d\n%d %d %c\n",Max,z1/2+1,z2/2+1,z3);
	return 0;
}
