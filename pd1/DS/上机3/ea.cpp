//�Ŵ��㷨������Ż������ͨ���㷨
//������Ľ�x��ʾΪ0-1����Ȼ���������ŵĶ����ƴ���ʹ��Ŀ�꺯��ֵf(x)�ﵽ��С

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/** �㷨�������� **/
//����0-1���ĳ��ȣ������ڱ�ʾ��ľ���
#define SLEN 200

//�������������
#define MAXGEN 100

//�������
#define mProb 1.0/SLEN

//Ⱥ���С����������Ⱥ���С��һ�������Բ�һ����
#define PSIZE 10

//һ����Ķ���
typedef struct {
	int x[SLEN];   //x:����Ա�����0-1��
	double y;      //y=f(x),Ҫ�Ż������Ŀ�꺯��ֵ
} Solution;

//����һ���⼯/�����飺��֮ΪȺ��population
Solution pop[PSIZE*2];     //�⼯���������Ӵ����洢�����ǰPSIZE���Ǹ���������PSIZE�����Ӵ�
Solution *current = pop;             //��ǰ����Ҳ���Ǹ���
Solution *offspring = pop + PSIZE;   //�Ӵ��⼯

//��������
void printPop(Solution *p,const char *str);

//��0-1��x����Ϊʵ��*xo ,�ٶ�����4bits��SLEN-4bitsΪС�����ֳ���
void decode(int *x, double *xo){
    //todo
//�������ֻ���10����

//С�����ֻ���10����
}


//����y=f(x) ,  0-1��x�ĳ��� SLEN
//���ӣ���y=x*x-3x+2����Сֵ ��������������4bits��С������SLEN-4bits
double func1(int *x){
	double xo;
	decode(x,&xo);  //��0-1��x����������Ľ�xo
	return xo*xo-3*xo+2;	 //����Ŀ�꺯��ֵ
}

//����һ��Ⱥ������н��Ŀ�꺯��ֵy �������˺���ָ�룬֧�ָ��������Ż�
void evaluate(Solution *P, double (*ptrf)(int *ptr)){
    //todo
    //y=f(x)
}

//�㷨��ʼ�������������⼯����Ŀռ䣬�������currentPop�еĽ⣬��������yֵ
void initialize(){
	for(int i=0;i<PSIZE;++i)      //����currentPop.pop��ÿ����
		for(int j=0;j<SLEN;++j)  //��ÿ�����0-1�����������
			current[i].x[j] = rand()%2;
	evaluate(current,func1);
}

//�Ӹ�����ѡ�������⣬ͨ���ӽ����������Ӵ�����
//����������ͨ��PKѡ�����������ѡ��
void crossover(){ //��������
	int k1,k2,f1,f2,k=0;
	while (k<PSIZE){   //�������Ӵ���һ������
        //todo
        //���ѡ��������������
        //���ȷ����������Ⱦɫ�彻��λ��
        //��������λ��ǰ��������Ӵ�
		k = k+2;
	}
}

//��offspring�еĸ�����б��죺�������ΪmProb
//��ν�������x[j]��ȡֵ 0-1������ 0 <--> 1
void mutate(){ //��������
	for(int i=0;i<PSIZE;++i)
		for(int j=0;j<SLEN;++j)
			if ((rand()%10000)/10000.0<mProb)
				(offspring[i].x[j]==0)?offspring[i].x[j]=1:offspring[i].x[j]=0;
}

//��currentPop��offspring��ѡ����һ�����壬�ж���ѡ���㷨������ͨ�������Ȱ�����Ⱥ������õı������� ��Ȼ��
//����1��ѡ����õ�PSIZE��Ϊ��һ�����ض�ѡ��
//����2����ÿ������һ��ѡ����ʣ�yֵС���ã��ı�ѡ��ĸ��ʾ͸ߣ�Ȼ�����ݴ˸��ʷֲ��������PSIZE��
//����3������ѡ�����ѡ��k�����໥pk��������õķ�����һ��������ѡ��PSIZE�� ����ɾ����ѡ���˵ģ�
void select(int k){ //ѡ������ �����ý���ѡ��
	double besty;   //������ѡ�������Ӵ���yֵ
	int best;       //������ѡ��������Ӵ��±�
	Solution tmp[PSIZE];
	for(int i=0;i<PSIZE;++i){ //һ��һ���Ӵ�ѡ��
        //todo: ��pop[2*psize]���÷���1��2��3ѡ��һ����Ӧ��ֵ��yֵ���õ�
		memcpy(&(tmp[i]),&(pop[best]),sizeof(Solution)); //ѡ������Ľ⣬���Ƶ���ʱ�⼯��
	}
	memcpy(current,tmp,sizeof(Solution)*PSIZE);
}

//���Ⱥ�����Ϣ
void printPop(Solution *p,const char *str){
	printf("%s/�⼯��Ϣ����: \n",str);
	for (int i=0;i<PSIZE;++i){
		printf("���� %3d : y=%10.6lf=f(",i,p[i].y);
		for (int j=0;j<SLEN;++j)
			printf("%d",p[i].x[j]);
		printf(")\n");
	}
}

int main(){
	int seed = 991;
	srand(seed); //������������ӣ�ʹ���㷨�����������
	initialize();
	printf("�� %d �� ",0);
	printPop(current,"��ǰȺ��");

	for(int gen=1;gen<MAXGEN;gen++){
		crossover();
		mutate();
		evaluate(offspring,func1);
		select(2);
		//printf("�� %d �� ",gen);
		//printPop(current,"��ǰȺ��");
	}
	printf("�� %d �� ", MAXGEN);
	printPop(current,"����Ⱥ��");
	return 1;
}
