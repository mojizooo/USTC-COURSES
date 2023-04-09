//n-�ʺ��������������㷨���ҵ��⼴��
//��һά���������ÿһ�лʺ���кţ�����solution[3]=4��ʾ�����е����з�����һ���ʺ�

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

//���öѷ���洢�ķ�ʽʵ��
unsigned *neighbors; //����ھӵ����飬����Ϊ0,1,2,...,size-1
unsigned *solution; //ÿ��һ���ʺ�solution[i]=row,��ʾ��j�еĻʺ���row��
int len;            //�ʺ�����
int size;      //ÿ�������ھ����̵����� size=(len-1)*len/2��¼�����������

//��������
void restart();
void chkSolution();

/***  ��ʼ��һ�����̲���,���ھ�����׼����  ***/
void initSolution(){
	srand(time(0));
	size = (len-1)*len/2;    //ѡ���н��н���
	solution = (unsigned *)malloc(sizeof(unsigned)*len);
	neighbors = (unsigned *)malloc(sizeof(unsigned)*size);
	if (!solution || !neighbors) exit(0); //����ռ�ʧ��

	for(int i=0;i<len;++i)    //�������ʼ���ֻ����ĳ����ʼ����
		solution[i] = i;
	for(int i=0;i<size;++i)  //�ھ������ʼ��
		neighbors[i] = i;
}

/***  �������̵�Ŀ�꺯�������̵ļ�ֵ: value=���໥�������Ļʺ������
 ***  ���ʺ��໥��������ʱ��Ŀ�꺯����ֵvalue==0
 ***   solution[i]==solution[j], (solution[i]-solution[j])/(i-j)==1��-1ʱ�������ʺ�˴��ܹ�������value++
 ***  ���̱��뷽ʽ�ܱ�֤������� solution[i]==solution[j]���ʸ��������Բ����ж�
 ***  �ú�����ʱ�������Ƿ�����ߣ�����ʾ������ǰһ�����value�������ھӵ�value, len*len => 2*len��
 ***/
int evaluate(){
	int value=0;
	//todo
	for(int i = 0;i < len;i++){
		for(int j = i + 1;j < len;j++){
			if(i != j){
				if (abs((int)(solution[i] - solution[j])) == abs(i - j))
				{
					/* code */
					value++;
					continue;
				}
			}
		}
	}

	/*for(int i = 0;i < len;i++){
		for(int j = 0;j < len;j++){
			if(solution[i] == j) printf("1 ");
			else printf("0 ");
		}
		putchar(10);
	}*/

	return value;
}

/***  ����û� randShuffle() ���޷Żصľ�����������������������ڲ�����С��ֱ��Ϊ0���㷨ֹͣ��
 ***  ������ neighbors ��������û�����
 ***  �õ������ݣ�size= neighbors�ĳ���
 ***  best found �����ò��Ÿú���
 ***/

int randInt(int i, int j){
	if(i == j)
		return i;
	else 
		return rand() % (i - j);
}
void randShuffle(){ //ÿ�������ѡ��k��Ԫ�س���,Ȼ���������顰��ǰĩβ��
    //todo
    int temp;
    int a;

    for(int i = len - 1;i >= 0;i--){
    	a = randInt(0, i);
    	temp = neighbors[a];
    	neighbors[a] = neighbors[i];
    	neighbors[i] = temp;
    }
}

/*** �������Ǿ��󣨲����Խ��ߣ��洢��һά�����У����±�k�;����±�i,j֮��Ĺ�ϵ����
 ***  ����k������i��j
 *** �����ھ�ʱ�������ھӵı��k���ҵ����Ӧ��Ҫ������i��j��
 ***/
void fromKtoIJ(int k, int *i, int *j){
    //todo
    for(int i1 = 0;i1 < len - 1;i1++){
    	for(int i2 = 1;i2 < len;i2++){
    		if(k == (i2 * (i2 + 1) / 2 - i2 + i1)) {
    			*i = i2;
    			*j = i1;
    			return ;
    		}
    	}
    }
}

void swap(unsigned int *a, unsigned int *b){
	int temp;
	temp = *a;
	*a = *b;
	*b = temp;
}

/***  ��鵱ǰ�⣨���̣����ھ����̣�����solution[i]��solution[j],i��j���ѡ�񣬹���n(n-1)/2�ֲ�ͬ�Ŀ��ܣ�
 ***  ������ͻ��С�����̣�������Ϊ�µĽ⣨best found���ԣ�, ���ع����½�ʱ�����������ھӱ��current
 ***  ������-1,��ʾû���ҵ����õ��ھӣ���Ҫ���� restart() ,����0��ʾ�ҵ�����Ľ⣬
 ***  ���ش���0��ֵ��ʾ��Ҫ���µ�ǰ��solution��Ҫ���������½���ھ�
 ***/
int traverseNeighbors(){
	int y_current = evaluate(); //��ǰ���̵�Ŀ�꺯��ֵ
	int y,current = -1;         //y���ھӵ�Ŀ�꺯��ֵ��current��ѡ������õ��ھӱ��
	int col1,col2,row1, row2;

    //�����ھӣ�����ÿ���ھӳ�ͻ�ʺ�Եĸ���y
	for(int i=0;i<size;++i){
		//����뵱ǰsolution��������ͬ���е��ھӵĲ�ͬ�еı��
		fromKtoIJ(neighbors[i], &col1, &col2);
	    //���������ж�Ӧ��ֵ���ʺ����ڵ��кţ�
	    row1 = solution[col1];
	    row2 = solution[col2];
	    // ������solution[col1] <--> solution[col2]
	    swap(&solution[col1], &solution[col2]);
	    //�����ͻ��y
	    y = evaluate();
	    //�������õĽ⣨�ھӣ�����Ϣ����ͻ�����ھӱ��
	    if(y == 0){
	    	return y;
	    }
	    if(y < y_current) current = i, y_current = y;
	    //��ɽ���������ھӶ������Ϻ�current��¼����õ��ھ�(best_found����)
	    // solution[col1] <--> solution[col2] �ظ���ԭ����׼��������һ���ھ�
	    swap(&solution[col1], &solution[col2]);
	}

	if (current==-1) {  //������������е��ھӽڵ㣬Ҳ�Ҳ������õ��ƶ���ʽ����ô����Ҫ���������㷨����ʼ��ָı�һ��
		printf("�Ҳ����⣬�����������ɳ�ʼ������������㷨��...\n");
		return -1;
	}
	fromKtoIJ(neighbors[current],&col1,&col2);  //�������ھ��뵱ǰsolution��ͬ�������б��
	row1 = solution[col1];
	solution[col1] = solution[col2];
	solution[col2] = row1;
	return y_current;
}

/***  �������������ھӣ�Ҳû���ҵ�y==0�����̲��֣�
 ***  ��ô�������solution��Ȼ��������ɽ������
 ***  ����������ھ��������ڵġ�΢С�����Ŷ��������Ŷ���Χ�������������times=20��
 ***/
void restart(){
	int times = 2;  //���������Ĵ������Ŷ���С,����times>1����
	for(int i=0;i<times;++i){
		int k = rand()%len;
		int j = rand()%len;
		int row = solution[k];
		solution[k] = solution[j];
		solution[j] = row;
	}
	puts("restart()�����ã�");
}

int main(){
	//int c1, c2; //����ѡ�����׼����������
	//long seed = 820;  //��������ӣ������������ı䣬��ôÿ���㷨���еĽ������һ���ģ���ʹ��rand()����
	//srand(seed);  //��һ��ע�͵�������ÿ�ε���������Ӷ���һ��

	printf("������ʺ������");
	scanf("%d",&len);     //���̶������̵Ĵ�С
	initSolution();
		evaluate();
	randShuffle();

	int flag;
	while ((flag = traverseNeighbors())!=0){
		if (flag<0)	restart();
		//else puts("once again");
	}

	printf("%d\n", evaluate());
	printf("�õ��Ľ�Ϊ��");

	for(int i=0;i<len;++i)
		printf("%d,",solution[i]);
	getchar();
	free(neighbors);
	free(solution);
}
