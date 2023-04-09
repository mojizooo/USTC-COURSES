#include <stdio.h>
#include <string.h>
#include <math.h>
int Map[100][100];
int gold[100][100];
int max(int a,int b){
	return a>b?a:b;
}
int min(int a,int b){
	return a<b?a:b;
}
int Solution (int size){
	int sum_step=2*size-1;
	gold[0][0]=Map[0][0];
	for(int step=1;step<sum_step;++step){
		for(int r1=min(size-1,step);r1>=0&&(step-r1)<=(size-1);--r1){
			for(int r2=min(size-1,step);r2>=0&&(step-r2)<=(size-1);--r2){
				int l1=step-r1,l2=step-r2;
				if(Map[r1][l1]==-1||Map[r2][l2]==-1){
					gold[r1][r2]=-1;
					continue;
				}
				if(r1>0)
					gold[r1][r2]=max(gold[r1][r2],gold[r1-1][r2]);
				if(r2>0)
					gold[r1][r2]=max(gold[r1][r2],gold[r1][r2-1]);
				if(r1>0&&r2>0)
					gold[r1][r2]=max(gold[r1][r2],gold[r1-1][r2-1]);
				if(gold[r1][r2]==-1) 
					continue;
				if(r1==r2)
					gold[r1][r2]+=Map[r1][l1];
				else
					gold[r1][r2]+=Map[r1][l1]+Map[r2][l2];
			}
		}
	}
	return max(gold[size-1][size-1],0);
}
int main(int argc, char const *argv[])
{
	int i=0,j;
	int m=0;
	int a[3000];
	while(1){
		scanf("%d",&a[i]);
		i++;
		if(getchar()=='\n') break;
	}
	m=sqrt(i);
	printf("%d\n",m );
	for(i=0;i<m;i++){
		for(j=0;j<m;j++){
			Map[i][j]=a[i*m+j];
			printf("%2d", Map[i][j]);
		}
		printf("\n");
	}
	printf("%d",Solution(m+1));
	return 0;
}