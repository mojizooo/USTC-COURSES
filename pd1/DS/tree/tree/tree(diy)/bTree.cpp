#ifndef _BITREE_CPP_
#define _BITREE_CPP_
//二叉树相关的实现代码
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <math.h>
using namespace std;
//定义存放数据的类型,假设是可以存放多个数据的结构体类型
typedef struct
{
	int id;
	int value;
} ElemType;

//定义二叉树的结点
typedef struct tnode
{
	ElemType data;
	struct tnode *lchild;
	struct tnode *rchild;
} bNode;

#include "showGT.h" //展示树和图的API

//打印某个结点的信息,依据Elemtype的定义而修改,详细版本（输出存储地址）
void cPrintNode(bNode *a)
{
	printf("\n*(addr = %lx):(id=%2d)= %5d", a, a->data.id, a->data.value);
}

/***-下面的代码是四种不同的构建二叉树的算法，已经输入信息的不同而不同 ***/
//构造二叉树（二叉排序树），输入长度为len的整数数组value
//value数组第0个元素为根的value，后续value依次和根比较，若比根小，就和根的左子树比较；否则和右子树比较；
//依次类推，若比较时遇到左子树或右子树为空，则以该value值构建新的树节点，并称为对应的左子树或右子树。

bNode *buildBTreeByValue(int *value, int len)
{
	bNode *root = (bNode *)malloc(sizeof(bNode));
	if (!root)
		exit(0);
	int idx = 0;
	root->data.id = idx;
	root->data.value = value[idx];
	root->lchild = root->rchild = NULL;
	getchar();
	cPrintNode(root);

	for (idx = 1; idx < len; ++idx)
	{
		//生成新节点
		bNode *t = (bNode *)malloc(sizeof(bNode));
		if (!t)
			exit(0);
		t->data.id = idx;
		t->data.value = value[idx];
		t->lchild = t->rchild = NULL;
		cPrintNode(t);

		//查找新节点在二叉树的准确位置
		bNode *q; //p的双亲结点
		for (bNode *p = root; p; (value[idx] < p->data.value) ? p = p->lchild : p = p->rchild)
			q = p;
		(value[idx] < q->data.value) ? q->lchild = t : q->rchild = t; //将新节点链入二叉树
		printf(", 其父节点地址 %lx", q);
	}
	return root;
}

//构造二叉树,输入长度为len的数组edge和value,下标即为结点编号id，
//edge[id]表示编号为id的结点的双亲结点的编号(0~len-1) ，根结点的双亲编号为-1
//value数组记录了结点的数据域value值
//算法思想：为每个结点构造一个结点，将它们的地址存在一个指针数组中；然后依据edge将这些结点链接成二叉树
bNode *buildBTreeByEdge(int *value, int *edge, int len)
{
	//首先需要检查edge数组是否代表一棵二叉树：唯一的-1，0~len-1每个树至多出现2次,edge[i]!=i.这里省略
	bNode **allnodes = (bNode **)malloc(sizeof(bNode *) * len); //len个指针
	if (!allnodes)
		exit(0);
	for (int i = 0; i < len; ++i)
	{
		allnodes[i] = (bNode *)malloc(sizeof(bNode));
		if (!(allnodes[i]))
			exit(0);
		allnodes[i]->data.id = i;
		allnodes[i]->data.value = value[i];
		allnodes[i]->lchild = allnodes[i]->rchild = NULL;
		//cPrintNode(allnodes[i]);
	}
	cout << "finished" << endl;
	bNode *root = (bNode *)malloc(sizeof(bNode));
	for (int i = 0; i < len; ++i)
	{ //二叉树不唯一，左右子树可以互换，优先构造左子树
		if (!edge[i])
			break;
		if (edge[i] != -1)
		{
			(allnodes[edge[i]]->lchild == NULL) ? allnodes[edge[i]]->lchild = allnodes[i] : allnodes[edge[i]]->rchild = allnodes[i];
		}
		else
		{
			root = allnodes[i], cPrintNode(root);
		}
	}
	return root;
}

//递归算法：构造二叉树,输入长度为len=2n+1的数组prelist，二叉树的节点数量为n
//先序序列prelist[i],若序列中遇到空结点，其值为NULLNODE，prelist中有n+1个NULLNODE
#define NULLNODE -9999
bNode *buildBTreeByPrelist(int *prelist, int len)
{
	bNode *t;
	static int idx = 0; //递归中每次调用自身都需要访问的“特殊”变量用静态变量或全局变量
	if (prelist[idx] == NULLNODE)
	{
		idx++;
		return NULL;
	}
	if (!(t = (bNode *)malloc(sizeof(bNode *))))
		exit(0);
	t->data.value = prelist[idx];
	t->data.id = idx;
	idx++; //准备访问prelist[idx]的下一个数据构建结点,idx无法放入形参列表
	t->lchild = buildBTreeByPrelist(prelist, len);
	t->rchild = buildBTreeByPrelist(prelist, len);
	return t;
} //如果prelist中的数据无法全部放入到一棵二叉树，如何检测？（构造结束后 idx<len-1)
//学习形参列表中无法表示子问题的“特征时”时，采用全局变量或静态变量来处理

//递归算法(先序遍历)：构造二叉树 ，输入先序序列pre和中序序列in，以及两个序列各自的上界pu,iu和下界pl,il
bNode *buildBTreeByPI(int *pre, int pl, int pu, int *in, int il, int iu)
{
	printf("\n%d-%d,%d-%d", pl, pu, il, iu);
	int il1, iu1, il2, iu2, pl1, pl2, pu1, pu2; //根节点把中序序列分成两个子序列，同样得到先徐序列的两个子序列，这是子序列的下标
	if (pu - pl != iu - il)
		exit(0); //检查输入参数
	if (pu - pl < 0)
		return NULL; //若序列为空，返回空结点/空树
	bNode *t = (bNode *)malloc(sizeof(bNode));
	if (!t)
		exit(0);
	t->data.value = pre[pl];
	t->data.id = pl;
	for (int i = il; i <= iu; ++i)
	{
		if (in[i] == pre[pl])
		{
			iu1 = i - 1;
			il1 = il;
			il2 = i + 1;
			iu2 = iu; //完成中序序列in的切割
			pl1 = pl + 1;
			pu1 = pl + (iu1 - il1 + 1);
			pl2 = pu1 + 1;
			pu2 = pu; //完成先徐序列pre的切割
		}
	}
	t->lchild = buildBTreeByPI(pre, pl1, pu1, in, il1, iu1);
	t->rchild = buildBTreeByPI(pre, pl2, pu2, in, il2, iu2);
	return t;
}

/*** 二叉树的其它基本操作  ***/
//查找给定结点p的父节点 , t非空时，表示已经找到，就不需要递归调用，直接返回
bNode *parent(bNode *root, bNode *p)
{
	bNode *t = NULL;
	if (!root || root == p)
		return p; //根无父节点，空树也没有p的父节点

	if (p && (root->lchild == p || root->rchild == p))
		return root;
	if (root->lchild && !t)
		t = parent(root->lchild, p);
	if (root->rchild && !t)
		t = parent(root->rchild, p);
	return t;
}

//由结点的id（可以改成其它数据域的值）查找结点，返回结点指针 。(先序遍历）
bNode *locateByID(bNode *root, int id)
{
	if (!root)
		return NULL;
	if (root->data.id == id)
		return root;
	bNode *t = locateByID(root->lchild, id);
	if (t)
		return t;
	return locateByID(root->rchild, id);
}

//采用后序遍历销毁树。不可用先序遍历，否则会丢失根节点的左右孩子。
void DestroyBTree(bNode *root)
{
	if (root->lchild)
	{
		DestroyBTree(root->lchild);
		root->lchild = NULL;
	}
	if (root->rchild)
	{
		DestroyBTree(root->rchild);
		root->rchild = NULL;
	}
	if (!root->lchild && !root->rchild)
		free(root);
}

/***-下面的代码是结点访问函数 visit() 的不同实现方式，实现对单个结点的处理，函数名通常作为二叉树遍历函数的参数 ***/
//打印某个结点的信息,依据Elemtype的定义而修改,简单版本（不输出存储地址）
void bPrintNode(bNode *a)
{
	printf("\n(id = %2d) = %5d", a->data.id, a->data.value);
}

//测试函数值，结点数据域的value值+1
void add1(bNode *a)
{
	a->data.value += 1;
}

/***-下面的代码是实现先序遍历、中序遍历和后序遍历的模板，大多数二叉树的操作基于对它们的修改 ***/
//先序遍历二叉树
void preTraverseTree(bNode *root, void (*ptrf)(bNode *a))
{
	if (root)
	{ //递归出口
		(*ptrf)(root);
		preTraverseTree(root->lchild, (*ptrf));
		preTraverseTree(root->rchild, (*ptrf));
	}
}

//中序遍历二叉树
void inTraverseTree(bNode *root, void (*ptrf)(bNode *a))
{
	if (root)
	{ //递归出口
		inTraverseTree(root->lchild, (*ptrf));
		(*ptrf)(root);
		inTraverseTree(root->rchild, (*ptrf));
	}
}

//后序遍历二叉树
void postTraverseTree(bNode *root, void (*ptrf)(bNode *a))
{
	if (root)
	{ //递归出口
		postTraverseTree(root->lchild, (*ptrf));
		postTraverseTree(root->rchild, (*ptrf));
		(*ptrf)(root);
	}
}

/***-下面的代码用于线索化二叉树：层序遍历结果以链表(链式队列)形式输出 ***/
//以下构成一个链式队列，存放二叉树的结点的地址，用于层序遍历二叉树
struct qNode
{						//队列结点
	bNode *ptr;			//队列的节点包括的数据域是二叉树结点的指针
	struct qNode *next; //队列的下一个结点，队列是单链表
};

typedef struct queue
{
	struct qNode *front;
	struct qNode *rear;
} linkQueue;

//从二叉树生成层序遍历的队列：分层线索化。输入二叉树，输出队列
//将该队列当成单链表遍历一次，可以实现层序遍历
//该算法也可以稍作修改即得到“层序遍历”算法（尝试一下）
linkQueue *ToHiraQueue(bNode *root)
{
	linkQueue *hQueue = (linkQueue *)malloc(sizeof(linkQueue));
	if (!hQueue)
		exit(0);
	if (!root)
	{
		hQueue->front = NULL;
		hQueue->rear = NULL;
		return hQueue;
	}

	struct qNode *head;												//线索化过程中的队头(不能修改hQueue->front，防止丢失)，队尾直接用hQueue->rear
	struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列哨兵结点（头结点，不存放有效数据的结点）
	if (!t)
		exit(0);
	head = t; //此时是空队列
	hQueue->rear = head;
	hQueue->front = hQueue->rear;
	//root入队
	t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列结点
	if (!t)
		exit(0);
	t->ptr = root;			//数据域赋值，指针next可以不用赋值(why?)
	hQueue->rear->next = t; //head->next = t
	hQueue->rear = t;		//hQueue->rear != head, head->next = hQueue->rear
	while (head != hQueue->rear)
	{					   //队列不空 ,head是哨兵结点，数据无效，有效数据从head->next开始
		head = head->next; //出队（模拟出队，因为要返回线索化的队列，所以不能修改队列的头指针)
		//printf("de-%lx,%d\n", head->ptr, head->ptr->data.value); //打印语句，调试用，查看入队、出队过程

		if (head->ptr->rchild)
		{ //head存放数据（结点）的右孩子非空，构建新队列结点，入队
			t = (struct qNode *)malloc(sizeof(struct qNode));
			if (!t)
				exit(0);
			t->ptr = head->ptr->rchild; //新结点的数据域赋值
			hQueue->rear->next = t;		//新节点接到队列尾部
			hQueue->rear = t;
			//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value); //打印语句，调试用，查看入队、出队过程
		}
		if (head->ptr->lchild)
		{ //head->next存放数据（结点）的左孩子非空，构建新队列结点，入队
			t = (struct qNode *)malloc(sizeof(struct qNode));
			if (!t)
				exit(0);
			t->ptr = head->ptr->lchild; //新结点的数据域赋值
			hQueue->rear->next = t;		//新节点接到队列尾部
			hQueue->rear = t;
			//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value); //打印语句，调试用，查看入队、出队过程
		}
	}
	return hQueue;
} //思考如何实现先序/中序/后序遍历的线索化？并输出线索化后的队列

//先序遍历线索化
linkQueue *ToPreQueue(bNode *root, linkQueue *hQueue)
{
	if (!root)
		return hQueue;
	if (!hQueue->front)
	{
		struct qNode *head;												//线索化过程中的队头(不能修改hQueue->front，防止丢失)，队尾直接用hQueue->rear
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列哨兵结点（头结点，不存放有效数据的结点）
		if (!t)
			exit(0);
		head = t; //此时是空队列
		hQueue->rear = head;
		hQueue->front = hQueue->rear;

		//root入队
		t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列结点
		if (!t)
			exit(0);
		t->ptr = root; //数据域赋值，指针next可以不用赋值(why?)
		hQueue->rear->next = t;
		hQueue->rear = t;
	}
	else
	{
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode));
		if (!t)
			exit(0);
		t->ptr = root;			//新结点的数据域赋值
		hQueue->rear->next = t; //新节点接到队列尾部
		hQueue->rear = t;
		//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value);
	}
	hQueue = ToPreQueue(root->lchild, hQueue);
	hQueue = ToPreQueue(root->rchild, hQueue);
	return hQueue;
}

//中序遍历线索化
linkQueue *ToInQueue(bNode *root, linkQueue *hQueue)
{
	if (!root)
		return hQueue;
	hQueue = ToInQueue(root->lchild, hQueue);
	if (!hQueue->front)
	{
		struct qNode *head;												//线索化过程中的队头(不能修改hQueue->front，防止丢失)，队尾直接用hQueue->rear
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列哨兵结点（头结点，不存放有效数据的结点）
		if (!t)
			exit(0);
		head = t; //此时是空队列
		hQueue->rear = head;
		hQueue->front = hQueue->rear;

		//root入队
		t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列结点
		if (!t)
			exit(0);
		t->ptr = root; //数据域赋值，指针next可以不用赋值(why?)
		hQueue->rear->next = t;
		hQueue->rear = t;
	}
	else
	{
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode));
		if (!t)
			exit(0);
		t->ptr = root;			//新结点的数据域赋值
		hQueue->rear->next = t; //新节点接到队列尾部
		hQueue->rear = t;
		//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value);
		//getchar();
	}
	hQueue = ToInQueue(root->rchild, hQueue);
	return hQueue;
}

//后序遍历线索化
linkQueue *ToPostQueue(bNode *root, linkQueue *hQueue)
{
	if (!root)
		return hQueue;
	hQueue = ToPostQueue(root->lchild, hQueue);
	hQueue = ToPostQueue(root->rchild, hQueue);
	if (!root && hQueue->rear)
		return hQueue;
	if (!hQueue->front)
	{
		struct qNode *head;												//线索化过程中的队头(不能修改hQueue->front，防止丢失)，队尾直接用hQueue->rear
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列哨兵结点（头结点，不存放有效数据的结点）
		if (!t)
			exit(0);
		head = t; //此时是空队列
		hQueue->rear = head;
		hQueue->front = hQueue->rear;

		//root入队
		t = (struct qNode *)malloc(sizeof(struct qNode)); //创建队列结点
		if (!t)
			exit(0);
		t->ptr = root; //数据域赋值，指针next可以不用赋值(why?)
		hQueue->rear->next = t;
		hQueue->rear = t;
	}
	else
	{
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode));
		if (!t)
			exit(0);
		t->ptr = root;			//新结点的数据域赋值
		hQueue->rear->next = t; //新节点接到队列尾部
		hQueue->rear = t;
		//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value);
	}
	return hQueue;
}

/*** 下面是一些典型应用 ***/
//求二叉树的高度/深度
int deepth(bNode *root)
{
	if (!root)
		return 0;
	int d = deepth(root->lchild);
	int n = deepth(root->rchild);
	return (d > n) ? d + 1 : n + 1;
}

//求二叉树度为2的结点数目
int node2(bNode *root)
{
	int c = 0;
	if (!root)
		return 0;
	if (root->lchild && root->rchild)
		c = 1;
	return c + node2(root->lchild) + node2(root->rchild);
}

//求二叉树度为1的结点数目
int node1(bNode *root)
{
	int c = 0;
	if (!root)
		return 0;
	if ((!root->lchild && root->rchild) || (root->lchild && !root->rchild))
		c = 1;
	return c + node1(root->lchild) + node1(root->rchild);
}

//求二叉树度为0的结点数目 (叶子结点数目）
int node0(bNode *root)
{
	if (!root)
		return 0;
	if (!root->lchild && !root->rchild)
		return 1;
	return node0(root->lchild) + node0(root->rchild);
}

//求二叉树度为0的结点数目的value之和
int value0(bNode *root)
{
	if (!root)
		return 0;
	if (!root->lchild && !root->rchild)
		return root->data.value;
	return value0(root->lchild) + value0(root->rchild);
}

//删除某节点及其子树
bNode *Del(bNode *root)
{
	if (root)
	{
		Del(root->lchild);
		Del(root->rchild);
		free(root);
		root = NULL;
	}
	return root;
}
//删除节点value = x的节点及其子树
bNode *Del_Valuex(bNode *root, int x)
{
	if (root->data.value == x)
	{
		root = Del(root);
	}
	else
	{
		if (root->lchild)
			root->lchild = Del_Valuex(root->lchild, x);
		if (root->rchild)
			root->rchild = Del_Valuex(root->rchild, x);
	}
	return root;
}
//给定id1和id2求共同祖先
bNode *Find_Ances(bNode *root, bNode *parent1, bNode *parent2)
{
	if (parent1->data.id == parent2->data.id)
	{
		bPrintNode(parent1);
		return parent1;
	}
	bNode *root1 = parent(root, parent1);
	bNode *root2 = parent(root, parent2);
	Find_Ances(root, root1, root2);
}
//给出value，求路径
int road[20] = {0};
int N = 0;
int Find_Value(bNode *root, int value)
{
	if (!root)
		return 0;
	if (root->data.value == value)
	{
		return 1;
	}
	if (Find_Value(root->lchild, value))
	{
		road[N++] = 1;
		return 1;
	}
	if (Find_Value(root->rchild, value))
	{
		road[N++] = 2;
		return 1;
	}
}
//递归求最大value和最小value之差
int max4(int a, int b, int c, int d)
{
	if (a >= b && a >= c && a >= d)
		return a;
	else if (b >= a && b >= c && b >= d)
		return b;
	else if (c >= a && c >= b && c >= d)
		return c;
	else
		return d;
}

int Sub_Max(bNode *root1, bNode *root2, int sub_max)
{
	if (!root1 || !root2)
		return sub_max;
	int sub = abs(root1->data.value - root2->data.value);
	if (sub > sub_max)
		return max4(Sub_Max(root2, root1->lchild, sub),
					Sub_Max(root2, root1->rchild, sub),
					Sub_Max(root1, root2->lchild, sub),
					Sub_Max(root1, root2->rchild, sub));
	else
		return max4(Sub_Max(root2, root1->lchild, sub_max),
					Sub_Max(root2, root1->rchild, sub_max),
					Sub_Max(root1, root2->lchild, sub_max),
					Sub_Max(root1, root2->rchild, sub_max));
}
int main()
{
	int n;
	linkQueue *hQueue = (linkQueue *)malloc(sizeof(linkQueue));
	linkQueue *qlist;
	int cho, cho1;
	int id1, id2;
	cout << "please input the initial length of value array:" << endl;
	cin >> n;
	cout << "please input your value array:" << endl;
	int val[n];
	int edge[100] = {0};
	bNode *t1, *t2;
	for (int i = 0; i < n; i++)
	{
		cin >> val[i];
	}
	while (1)
	{
		cout << "1 - build" << endl;
		cout << "2 - graph" << endl;
		cout << "3 - locate by ID" << endl;
		cout << "4 - destroy" << endl;
		cout << "5 - traverse" << endl;
		cout << "6 - linearize" << endl;
		cout << "7 - deepth" << endl;
		cout << "8 - amount of node" << endl;
		cout << "9 - delete" << endl;
		cout << "10 - max difference" << endl;
		cout << "11 - ancestor" << endl;
		cout << "12 - way to value" << endl;
		cout << "13 - exit" << endl;
		cin >> cho;
		switch (cho)
		{
		case 1:
			cout << "1 - by value" << endl;
			cout << "2 - by edge" << endl;
			cin >> cho1;
			//DestroyBTree(t1);
			switch (cho1)
			{
			case 1:
				t1 = buildBTreeByValue(val, n);
				cout << endl
					 << "finished" << endl;
				break;
			case 2:
				cout << "input your edge array:" << endl;
				for (int i = 0; i < n; i++)
				{
					cin >> edge[i];
				}
				t1 = buildBTreeByEdge(val, edge, n);
				cout << "finished" << endl;
				break;
			}
			break;

		case 2:
			saveTree(t1, "graph.html");
			break;

		case 3:
			cout << "pls input your id" << endl;
			cin >> cho1;
			cPrintNode(locateByID(t1, cho1));
			cout << endl;
			break;

		case 4:
			DestroyBTree(t1);
			cout << "finished" << endl;
			break;

		case 5:
			cout << "1 - In" << endl;
			cout << "2 - pre" << endl;
			cout << "3 - post" << endl;
			cin >> cho1;
			switch (cho1)
			{
			case 1:
				inTraverseTree(t1, cPrintNode);
				break;
			case 2:
				preTraverseTree(t1, cPrintNode);
				break;
			case 3:
				postTraverseTree(t1, cPrintNode);
				break;
			}
			cout << endl;
			break;

		case 6:
			cout << "1 - level" << endl;
			cout << "2 - In" << endl;
			cout << "3 - pre" << endl;
			cout << "4 - post" << endl;
			cin >> cho1;
			switch (cho1)
			{
			case 1:
				qlist = ToHiraQueue(t1);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //打印线索化链表
				printf("\n");
				break;
			case 2:
				hQueue->front = NULL;
				hQueue->rear = NULL;
				qlist = ToInQueue(t1, hQueue);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //打印线索化链表
				printf("\n");
				break;
			case 3:
				hQueue->front = NULL;
				hQueue->rear = NULL;
				qlist = ToPreQueue(t1, hQueue);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //打印线索化链表
				printf("\n");
				break;
			case 4:
				hQueue->front = NULL;
				hQueue->rear = NULL;
				qlist = ToPostQueue(t1, hQueue);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //打印线索化链表
				printf("\n");
				break;
			}

		case 7:
			cout << deepth(t1) << endl;
			break;

		case 8:
			cout << "nodes that deg = 2: " << node2(t1) << endl;
			cout << "nodes that deg = 1: " << node1(t1) << endl;
			cout << "nodes that deg = 0: " << node0(t1) << endl;
			break;

		case 9:
			cout << "your value: " << endl;
			cin >> cho1;
			t1 = Del_Valuex(t1, cho1);
			cout << "finished" << endl;
			break;

		case 10:
			cout << Sub_Max(t1, t1, 0) << endl;
			break;

		case 11:
			cout << "pls input ur id1 and id2" << endl;
			cin >> id1 >> id2;
			Find_Ances(t1, locateByID(t1, id1), locateByID(t1, id2));
			cout << endl;
			break;

		case 12:
			cout << "pls input ur value" << endl;
			N = 0;
			cin >> cho1;
			Find_Value(t1, cho1);
			for (int i = N - 1; i >= 0; i--)
				cout << road[i] << endl;
			break;
		case 13:
			exit(0);
		default:
			break;
		}
	}
	/*
	printf("\n测试二叉树生成 value:");
	bNode *t1 = buildBTreeByValue(val, n); //测试由值数组生成二叉树
	preTraverseTree(t1, add1);			   //测试先序遍历
	inTraverseTree(t1, cPrintNode);		   //测试中序遍历
	postTraverseTree(t1, bPrintNode);	   //测试后续遍历
	//DestroyBTree(t1);

	printf("\n测试二叉树生成 edge :");//增加边数组
	bNode *t2 = buildBTreeByEdge(val, edge, n);
	cPrintNode(t2);					 //测试由值数组和边生成二叉树
	preTraverseTree(t2, bPrintNode); //测试先序遍历
	inTraverseTree(t2, add1);		  //测试中序遍历
	postTraverseTree(t2, cPrintNode); //测试后续遍历
	//estroyBTree(t2);

	getchar();
	Find_Value(t1, 18);
	for (int i = N - 1; i >= 0; i--)
		cout << road[i] << endl;
	/*printf("\n测试二叉树生成 Prelist:");
	int prelist[15] = {17, 32, 41, -9999, -9999, -9999, 13, 7, -9999, -9999, 16, 22, -9999, -9999, -9999};
	bNode *t3 = buildBTreeByPrelist(prelist, 15);
	preTraverseTree(t3, cPrintNode); //测试先序遍历
	getchar();
	inTraverseTree(t3, cPrintNode); //测试中序遍历
	getchar();
	postTraverseTree(t3, bPrintNode); //测试后续遍历

	//测试层序线索化
	saveTree(t1, "sg.html");
	saveTree(t2, "test.html");
	printf("\n测试层序线索化:");
	linkQueue *hQueue = (linkQueue *)malloc(sizeof(linkQueue));
	hQueue->front = NULL;
	hQueue->rear = NULL;
	linkQueue *qlist = ToHiraQueue(t2);
	for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
		getchar(), printf("%d, ", p->next->ptr->data.value); //打印线索化链表
	printf("\n");

	getchar();
	cout << Sub_Max(t1, t2, 0) << endl;
	//测试结点查找和求父节点
	/*printf("\n测试结点查找和求父节点:");
	bNode *tn = locateByID(t2, 2);
	if (!tn)
		printf("\n没找到结点");
	else
	{
		cPrintNode(tn);
		printf("\n父节点为：");
		tn = parent(t2, tn);
		if (!tn)
			printf("没找到");
		else
			cPrintNode(tn);
	}
	DestroyBTree(t2);
	getchar();*/

	//测试先序序列和中序序列构造二叉树
	/*printf("\n测试二叉树生成 PI:");
	int pre[] = {17, 32, 41, 13, 7, 16, 22};
	int in[] = {41, 32, 17, 7, 13, 22, 16};
	bNode *t1 = buildBTreeByPI(pre, 0, 6, in, 0, 6);
	getchar();
	if (t1)
	{
		preTraverseTree(t1, cPrintNode); //测试先序遍历
		getchar();
		inTraverseTree(t1, cPrintNode); //测试中序遍历
		getchar();
		postTraverseTree(t1, cPrintNode); //测试后续遍历
	}

	//典型应用测试
	printf("\n树高度 %d ", deepth(t1));
	printf("\n树度为2的结点数目 %d ", node2(t1));
	printf("\n树度为0的结点数目 %d ", node0(t1));
	printf("\n树度为1的结点数目 %d ", node1(t1));
	printf("\n树度为0的结点value之和 %d ", value0(t1));

	DestroyBTree(t1);*/

	return 1;
}

#endif
