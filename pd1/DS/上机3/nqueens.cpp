//n-皇后问题的随机搜索算法，找到解即可
//用一维数组来存放每一列皇后的行号，比如solution[3]=4表示第四列第五行放置了一个皇后

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

//采用堆分配存储的方式实现
unsigned *neighbors; //存放邻居的数组，内容为0,1,2,...,size-1
unsigned *solution; //每列一个皇后，solution[i]=row,表示第j列的皇后在row行
int len;            //皇后数量
int size;      //每个棋盘邻居棋盘的数量 size=(len-1)*len/2记录数组最大容量

//函数声明
void restart();
void chkSolution();

/***  初始化一个棋盘布局,将邻居数组准备好  ***/
void initSolution(){
	srand(time(0));
	size = (len-1)*len/2;    //选两列进行交换
	solution = (unsigned *)malloc(sizeof(unsigned)*len);
	neighbors = (unsigned *)malloc(sizeof(unsigned)*size);
	if (!solution || !neighbors) exit(0); //分配空间失败

	for(int i=0;i<len;++i)    //随机给初始布局或给定某个初始布局
		solution[i] = i;
	for(int i=0;i<size;++i)  //邻居数组初始化
		neighbors[i] = i;
}

/***  计算棋盘的目标函数（棋盘的价值: value=可相互攻击到的皇后对数）
 ***  当皇后相互攻击不到时，目标函数的值value==0
 ***   solution[i]==solution[j], (solution[i]-solution[j])/(i-j)==1或-1时，两个皇后彼此能攻击到，value++
 ***  棋盘编码方式能保证不会出现 solution[i]==solution[j]，故该条件可以不用判断
 ***  该函数的时间性能是否能提高？（提示：利用前一个解的value，调整邻居的value, len*len => 2*len）
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

/***  随机置换 randShuffle() ，无放回的均匀随机采样（被采样集合在不断缩小，直至为0，算法停止）
 ***  对数组 neighbors 进行随机置换操作
 ***  用到的数据：size= neighbors的长度
 ***  best found 策略用不着该函数
 ***/

int randInt(int i, int j){
	if(i == j)
		return i;
	else 
		return rand() % (i - j);
}
void randShuffle(){ //每次随机挑选第k个元素出来,然后存放在数组“当前末尾”
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

/*** 若下三角矩阵（不含对角线）存储在一维数组中，则下标k和矩阵下标i,j之间的关系换算
 ***  输入k，返回i和j
 *** 遍历邻居时，给定邻居的编号k，找到其对应的要交换的i，j列
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

/***  检查当前解（棋盘）的邻居棋盘（交换solution[i]和solution[j],i和j随机选择，共有n(n-1)/2种不同的可能）
 ***  保留冲突最小的棋盘，将它视为新的解（best found策略）, 返回构建新解时交换而来的邻居编号current
 ***  若返回-1,表示没有找到更好的邻居，需要重启 restart() ,返回0表示找到所求的解，
 ***  返回大于0的值表示需要更新当前解solution后要继续遍历新解的邻居
 ***/
int traverseNeighbors(){
	int y_current = evaluate(); //当前棋盘的目标函数值
	int y,current = -1;         //y是邻居的目标函数值，current是选出来最好的邻居编号
	int col1,col2,row1, row2;

    //遍历邻居，评估每个邻居冲突皇后对的个数y
	for(int i=0;i<size;++i){
		//获得与当前solution有两个不同的列的邻居的不同列的编号
		fromKtoIJ(neighbors[i], &col1, &col2);
	    //保存这两列对应的值（皇后所在的行号）
	    row1 = solution[col1];
	    row2 = solution[col2];
	    // 交换：solution[col1] <--> solution[col2]
	    swap(&solution[col1], &solution[col2]);
	    //计算冲突数y
	    y = evaluate();
	    //保留更好的解（邻居）的信息：冲突数和邻居编号
	    if(y == 0){
	    	return y;
	    }
	    if(y < y_current) current = i, y_current = y;
	    //爬山法，所有邻居都检查完毕后，current记录了最好的邻居(best_found策略)
	    // solution[col1] <--> solution[col2] 回复解原样，准备访问下一个邻居
	    swap(&solution[col1], &solution[col2]);
	}

	if (current==-1) {  //如果遍历了所有的邻居节点，也找不到更好的移动方式，那么就需要重新启动算法，初始棋局改变一下
		printf("找不到解，正在重新生成初始解和运行搜索算法中...\n");
		return -1;
	}
	fromKtoIJ(neighbors[current],&col1,&col2);  //获得最佳邻居与当前solution不同的两个列编号
	row1 = solution[col1];
	solution[col1] = solution[col2];
	solution[col2] = row1;
	return y_current;
}

/***  当遍历完所有邻居，也没有找到y==0的棋盘布局，
 ***  那么随机重置solution，然后再用爬山法搜索
 ***  随机重启：邻居是邻域内的“微小”的扰动，增加扰动范围，比如随机交换times=20次
 ***/
void restart(){
	int times = 2;  //随机交换解的次数，扰动大小,设置times>1即可
	for(int i=0;i<times;++i){
		int k = rand()%len;
		int j = rand()%len;
		int row = solution[k];
		solution[k] = solution[j];
		solution[j] = row;
	}
	puts("restart()被调用！");
}

int main(){
	//int c1, c2; //两个选择出来准备交换的列
	//long seed = 820;  //随机数种子，如果这个数不改变，那么每次算法运行的结果都是一样的，即使用rand()函数
	//srand(seed);  //这一句注释掉，等于每次的随机数种子都不一样

	printf("请输入皇后个数：");
	scanf("%d",&len);     //键盘读入棋盘的大小
	initSolution();
		evaluate();
	randShuffle();

	int flag;
	while ((flag = traverseNeighbors())!=0){
		if (flag<0)	restart();
		//else puts("once again");
	}

	printf("%d\n", evaluate());
	printf("得到的解为：");

	for(int i=0;i<len;++i)
		printf("%d,",solution[i]);
	getchar();
	free(neighbors);
	free(solution);
}
