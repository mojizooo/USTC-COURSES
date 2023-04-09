#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char const *argv[])
{
	int Wall[55][55][5]; 
	/*
	  三维数组用于储存各个教室四周墙的存在情况；
	  从(1,1)处开始储存；
	  [][][0]为西，[][][1]为北，[][][2]为东，[][][3]为南。
	*/
	int Map[55][55]; //用于具体刻画教室的分类与遍历过程
	int row, line;   //用于储存行列的输入
	int i, j, k;     //循环控制变量
	int drow[4] = {0, -1, 0, 1}, dline[4] = {-1, 0, 1, 0}; 
	/*
	  分别控制行列的变化；
	  [0]为西，[1]为北，[2]为东，[3]为南；
	  分别用当时行列数加对应元素即可做到向相应方向“移动”；
	*/
	int posrow[2600], posline[2600];  //储存遍历时已经过的位置
	int room_num = 0;                 //教室编号
	int maxbef = 0, maxaft = 0;       //储存破坏墙壁前后教室最大尺寸
	int room_size[2600];              //储存各个编号教室大小
	int target_row, target_line;
	char target_direction;            //储存最终需砸掉墙壁的相邻单位与方向
    
    //主函数

    //数组初始化
	memset(Wall, 0, sizeof(Wall));    
	memset(Map, 0, sizeof(Map));       
	memset(room_size, 0, sizeof(room_size));  
	scanf("%d %d", &line, &row);
	for (i = 1; i <= row; i++)
	{
		for (j = 1; j <= line; j++)
		{   //位运算处理墙的位置
			int x;
			scanf("%d", &x);
			if (x & 1)
				Wall[i][j][0] = 1;  //1代表此处有墙
			if (x & 2)
				Wall[i][j][1] = 1;
			if (x & 4)
				Wall[i][j][2] = 1;
			if (x & 8)
				Wall[i][j][3] = 1;
		}
	}

	//开始搜索

	for (i = 1; i <= row; i++)
	{
		for (j = 1; j <= line; j++)
		{
			if (!Map[i][j])            //若尚未被编号
			{
				int rear = 0, head = 1, sum = 1;
				/*
				  rear代表目前所到达的教室数量，head代表rear加上从此位置出发可到达的教室数量；
				  当rear=head时代表已没有教室可走。
				*/
				posrow[1] = i;       
				posline[1] = j;         //从[1][1]开始储存走过的位置
				Map[i][j] = ++room_num; //编号      
				while (rear < head)
				{
					rear++;
					int r = posrow[rear], l = posline[rear];
					for (k = 0; k < 4; k++)
					{   //四个方向都测试一遍
						int curr = r + drow[k], curl = l + dline[k];  
						if (curr > 0 && curr <= row && curl > 0 && curl <= line && !Map[curr][curl] && !Wall[r][l][k])
						{                                                      //新到达的位置未被编号且该方向上没有墙
							sum++;
							Map[curr][curl] = room_num;  //编号
							posrow[++head] = curr;      
							posline[head] = curl;        //更新位置
						}
					}
				}
				maxbef = maxbef > sum ? maxbef : sum;    //储存最大值
				room_size[room_num] = sum;                           
			}
		}
	}

    //寻找目标墙
	printf("%d\n%d\n", room_num, maxbef);                   //输出教室数量和目前最大尺寸
	for (j = 1; j <= line; j++)
		//最南开始
		for (k = 1; k <= 2; k++)
		    for (i = row; i >= 1; i--)
		    {   /*
		    	  处先循环行数的原因：
		    	  从右下角开始从下往上，先搜北面的再搜东面的
		    	  确保所搜索到的第一堵墙一定先最西后最南
		    	  如果先循环方向，则无法确保在多解情况下最优解在最西（但事实上这样也可以ac）
		    	*/
				if (Wall[i][j][k])
				{   //如果有墙
					int curr = i + drow[k], curl = j + dline[k];
					int Max = room_size[Map[i][j]] + room_size[Map[curr][curl]];
					//Max临时储存砸掉此墙所能得到的教室尺寸
					if (Max > maxaft && Map[i][j] != Map[curr][curl])
					{  //如果得到的尺寸更大且墙两边的教室编号不同
						maxaft = Max;
						target_row = i;
						target_line = j;
						target_direction = k % 2 ? 'N' : 'E';
					}
				}
			
		}
	printf("%d\n", maxaft);
	printf("%d %d %c\n", target_row, target_line, target_direction);
	return 0;
}