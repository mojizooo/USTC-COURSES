#include <stdio.h>
#include <stdlib.h>

#define ElemType int //使用宏定义便于替换不同数据类型 

#define _DEBUG_ 1    //使用宏定义以产生/屏蔽调试信息


typedef struct Lnode
{   //定义结构体，包括数据内容和结点
	ElemType data;       
	struct Lnode * next; 
	
} LinkNode, * LinkList;  //定义常量型变量和指针型变量

LinkNode *first;         //构建头结点

LinkNode *Ddd(LinkList p, int mink, int maxk){
	if(p->next == NULL || mink > maxk) return NULL;
	LinkNode *q = p;
	for(p = p->next;p;p = p->next){
		if(p->data >= mink) break;
		q = p;
	}
	while(p){
		if(p->data > maxk) break;
		LinkNode *temp = p;
		p = p->next;
		free(temp);
	}
	q->next = p;
	return q;
}

LinkNode *initList(){
	//创建链表
	LinkNode *p = (LinkNode *)malloc(sizeof(LinkNode)); //初始化头结点及分配空间
	if (!p) {
		//如果创建失败则退出程序
		printf("初始化分配头结点失败！\n");
		exit(0);
	}
	p->next = NULL;   //使头结点的下一个结点为空（避免出现野指针）
	return p;
}

#ifdef _DEBUG_  //将调试代码与其他部分分隔开

LinkNode head;


void initList1(LinkNode *p){
	//另一种链表创建方式
	p = (LinkNode *)malloc(sizeof(LinkNode));
	if (!p) {
		printf("初始化分配头结点失败！\n");
		exit(0);
	}
	p->next = NULL;
}

void initList2(){
	//另一种链表创建方式
	first = &head;
	first->next = NULL;
}
#endif

int ListLength(LinkList p){
	//计算链表元素数目即链表长度
	int count = 0;
	while (p->next!=NULL){
		//链表非空则后移指针
		count++;
		p = p->next;
	}
	return count;
}

int ListEmpty(LinkList p){
	//判断链表是否为空
	if (p->next!=NULL)
		return 1;
	return 0;
}

void ClearList(LinkList p){
	//清空链表
	LinkNode *q; //临时构建指针用于继承被删除结点的后续内容
	while(p->next!=NULL){
		q = p->next;
		q->next = q->next;
		free(q); //释放结点
	}
}

void DestroyList(LinkList p){
	//删除链表
	ClearList(p);
	free(p); //释放目标结点
}

int GetElem(LinkList p, int i, ElemType *e){
	//获取链表中元素
	int k = 0;
	while(p){
		k++;
		if (k == i){//如果找到目标结点
			*e = p->data;
			return k;
		}
		p = p->next;
	}
	return 0;
}

LinkNode *LocateElem(LinkList p, ElemType e){
	//找寻目标元素的位置（只能找到次序最靠前的元素）
	while(p){
		if (p->data == e) //如果找到则返回相应指针
			return p;
		p = p->next;
	}
	return NULL;
}

LinkNode *PriorElem(LinkList p, LinkNode *cur_e){
	//找寻目标结点的父节点
	for (;p->next;p = p->next) //用for循环代替while循环，子结点非空则继续遍历
		if (p->next == cur_e)
			return p;          //如果找到则返回其父结点
	return NULL;
}

LinkNode *NextElem(LinkList p, LinkNode *e){
	//找寻当前结点的子结点
	return e->next;
}
LinkNode *ListInsert(LinkList p, int i, ElemType e){
	//向链表中插入元素
	if (i < 1) return NULL; //如果输入不合法则返回空指针
	for (;p;p = p->next)    //当前结点不为空则继续遍历
		if (--i < 1){       //如果到达目标位置
			LinkNode *q = (LinkNode *)malloc(sizeof(LinkNode)); //初始化新结点及分配空间
			if (!q) {
				printf("插入节点时，分配空间失败！\n");
				exit(0);	
			}
			//插入新结点
			q->next = p->next;
			p->next = q;
			q->data = e;
			return q;		//返回新结点
		}
	return NULL;
}

int ListDelete(LinkList p, int i, ElemType *e){
	//删除链表中目标结点同时取出所包含的元素
	if (i < 1) return 0; //输入不合法返回0，代表删除失败
	LinkNode *q = p;
	for(p = p->next;p;p = p->next){
		if (--i < 1){    //如果到达目标位置
			q->next = p->next;
			*e = p->data;
			free(p); 	 //此时由于q = p故不用free(q)
			return 1;    //返回1，代表删除成功
		}
		q = p;			 //若未到达则继续继承当前结点进行下一次遍历
	}
	return 0;
}

void PrintLinkNode(LinkNode *p){
	//输出目标结点元素
	printf("%d,", p->data);
}

void Add2(LinkNode *p){
	//目标结点元素数值+2
	p->data += 2;
	printf("+2,");
}

void DebugLinkNode(LinkNode *p){
	//调试目标结点
	printf("结点-(*addr)=value:");
	printf("((*%p)=%d\n", p, p->data);
}

void ListTraverse(LinkList p,void (*ptrFunc)(LinkNode *ptr)){
	//遍历链表
	printf("链表(表长=%d)：", ListLength(p));
	while (p){
		//p非空则对p进行传递进来的函数操作
		(*ptrFunc)(p);
		p = p->next;
	}
	printf("\n");
}

int main(){

	void (*ptrFunc)(LinkNode *p) = DebugLinkNode; //定义函数指针

	first = initList(); //创建头结点

	ListTraverse(first, ptrFunc);
	ListInsert(first, 1, 2);
	ListInsert(first, 1, 3);
	ListInsert(first, 1, 4);
	ListInsert(first, 1, 5);
	ListTraverse(first, ptrFunc);
	ListInsert(first, 1, 6);
	ListInsert(first, 1, 7);
	ListInsert(first, 1, 8);
	ListInsert(first, 1, 9);
	ListTraverse(first, ptrFunc);
	ListInsert(first, 3, 666);
	ListInsert(first, 5, 777);
	ListInsert(first, 7, 888);
	ListInsert(first, 9, 999);
	ListTraverse(first, ptrFunc);

	ElemType ei;
	printf("取数据之前%d --", ei);
	GetElem(first, 10, &ei);  //向ei的地址中读入链表中的数据
	printf("读取的数据为%d \n", ei);

	LinkNode *q = LocateElem(first,888);
	if (!q)
		printf("没找到值所对应的结点\n" );
	else{
		q = PriorElem(first,q);
		printf("找到结点的前驱为%d -- ", q->data);
		printf("找到结点为%d -- ", q->next->data);
		if (q->next->next) //如果当前结点的子结点非空
			printf("找到结点的后继为%d ", NextElem(first,NextElem(first, q))->data);
		printf("\n" );
	}

	printf("删除前的值%d -- ", ei);
	if (ListDelete(first, 1, &ei) > 0)
		printf("删除的值为%d\n", ei);
	else
		printf("删除失败%d \n", ei);

	ListTraverse(first, ptrFunc);
	printf("删除前的值%d -- ", ei);
	if (ListDelete(first, 10, &ei) > 0)
		printf("删除的值为%d\n", ei);
	else
		printf("删除失败%d \n", ei);

	printf("删除前的值%d -- ", ei);
	if (ListDelete(first, 6, &ei) > 0)
		printf("删除的值为%d\n", ei);
	else
		printf("删除失败%d \n", ei);
	ListTraverse(first,ptrFunc);

	ptrFunc = Add2;
	printf("每个数据元素准备+2\n" );
	ListTraverse(first,ptrFunc);
	printf("完成+2后，新的链表:");
	ListTraverse(first,PrintLinkNode);


	DestroyList(first);

	return 0;
}