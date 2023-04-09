/*
	枚举某两颗水稻：
	1、 路径上选择的前者要能一步到达稻田之外；
	2、 最后一步亦要落在稻田之外；
	3、 跳到稻田之外需要的步数应大于目前最大；
*/

/*
	提示：
	使用结构体；
	排序后查找目标位置而非直接寻找。
*/

#include <stdio.h>
#include <stdlib.h>
int r, c, n;
struct PLANT {
	int x, y;
};
PLANT plants[5001];
PLANT plant;
int myCompare( const void *ele1, const void *ele2 )；
int searchPath(PLANT secPlant, int dX, int dY) ;
int main(void)
{	
	int i,j, dX, dY, pX, pY, steps, max = 2;
	scanf("%d%d", &r, &c);
	scanf("%d", &n);
	for (i = 0; i < n; i++)
		scanf("%d%d", &plants[i].x, &plants[i].y);
	qsort(plants, n, sizeof(PLANT), myCompare);
	for (i = 0; i < n - 2; i++)  //plants[i]是第一个点
		for ( j = i + 1; j < n -1 ; j++) {  // plants[j]是第二个点
		    dX = plants[ j ].x - plants[i].x; 
		    dY = plants[ j ].y - plants[i].y;
		    pX = plants[ i ].x - dX; 
		    pY = plants[ i ].y - dY;
		    if (pX <= r && pX >= 1 && pY <= c && pY >= 1)
			continue; //第一点的前一点在稻田里，说明本次选的第
 				  //二点导致的步长不合理，取下一个点作为第二点
		    if (plants[ i ].x + (max - 1) * dX > r)
			break;    //x方向过早越界了。说明本次选的第二点不成立。
	//如果换下一个点作为第二点，x方向步长只会更大，更不成立，所以应该
	//认为本次选的第一点都是不成立的，那么取下一个点作为第一点再试
		    pY = plants[ i ].y + (max - 1) * dY;
		    if ( pY > c || pY < 1)
			continue; //y方向过早越界了，应换一个点作为第二点再试
		    steps = searchPath(plants[ j ],dX,dY); //看看从这两点出发，一共
							//能走几步
		    if (steps > max)  	max = steps;
		}
    if ( max == 2 ) max = 0;
	printf("%d\n", max);  
}

int myCompare( const void *ele1, const void *ele2 )
{
	PLANT *p1, *p2;
	p1 = (PLANT*) ele1;
	p2 = (PLANT*) ele2;
	if ( p1->x == p2->x ) return(p1->y - p2->y);
	return ( p1->x - p2->x );
}

int searchPath(PLANT secPlant, int dX, int dY)
{
	PLANT plant;
	int steps;

	plant.x = secPlant.x + dX;
	plant.y = secPlant.y + dY;
	steps = 2;
	while (plant.x <= r && plant.x >= 1 && plant.y <= c && plant.y >= 1) {
		if (!bsearch(&plant, plants, n, sizeof(PLANT), myCompare)) 	{ //每一步都必须踩倒水稻才算合理，否则这就不是一条行走路径
			steps = 0;
			break;
		}
		plant.x += dX; 
		plant.y += dY;
		steps++;
	}
	return(steps);
}
