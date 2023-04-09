#ifndef _BITREE_CPP_
#define _BITREE_CPP_
//��������ص�ʵ�ִ���
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <math.h>
using namespace std;
//���������ݵ�����,�����ǿ��Դ�Ŷ�����ݵĽṹ������
typedef struct
{
	int id;
	int value;
} ElemType;

//����������Ľ��
typedef struct tnode
{
	ElemType data;
	struct tnode *lchild;
	struct tnode *rchild;
} bNode;

#include "showGT.h" //չʾ����ͼ��API

//��ӡĳ��������Ϣ,����Elemtype�Ķ�����޸�,��ϸ�汾������洢��ַ��
void cPrintNode(bNode *a)
{
	printf("\n*(addr = %lx):(id=%2d)= %5d", a, a->data.id, a->data.value);
}

/***-����Ĵ��������ֲ�ͬ�Ĺ������������㷨���Ѿ�������Ϣ�Ĳ�ͬ����ͬ ***/
//����������������������������볤��Ϊlen����������value
//value�����0��Ԫ��Ϊ����value������value���κ͸��Ƚϣ����ȸ�С���ͺ͸����������Ƚϣ�������������Ƚϣ�
//�������ƣ����Ƚ�ʱ������������������Ϊ�գ����Ը�valueֵ�����µ����ڵ㣬����Ϊ��Ӧ������������������

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
		//�����½ڵ�
		bNode *t = (bNode *)malloc(sizeof(bNode));
		if (!t)
			exit(0);
		t->data.id = idx;
		t->data.value = value[idx];
		t->lchild = t->rchild = NULL;
		cPrintNode(t);

		//�����½ڵ��ڶ�������׼ȷλ��
		bNode *q; //p��˫�׽��
		for (bNode *p = root; p; (value[idx] < p->data.value) ? p = p->lchild : p = p->rchild)
			q = p;
		(value[idx] < q->data.value) ? q->lchild = t : q->rchild = t; //���½ڵ����������
		printf(", �丸�ڵ��ַ %lx", q);
	}
	return root;
}

//���������,���볤��Ϊlen������edge��value,�±꼴Ϊ�����id��
//edge[id]��ʾ���Ϊid�Ľ���˫�׽��ı��(0~len-1) ��������˫�ױ��Ϊ-1
//value�����¼�˽���������valueֵ
//�㷨˼�룺Ϊÿ����㹹��һ����㣬�����ǵĵ�ַ����һ��ָ�������У�Ȼ������edge����Щ������ӳɶ�����
bNode *buildBTreeByEdge(int *value, int *edge, int len)
{
	//������Ҫ���edge�����Ƿ����һ�ö�������Ψһ��-1��0~len-1ÿ�����������2��,edge[i]!=i.����ʡ��
	bNode **allnodes = (bNode **)malloc(sizeof(bNode *) * len); //len��ָ��
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
	{ //��������Ψһ�������������Ի��������ȹ���������
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

//�ݹ��㷨�����������,���볤��Ϊlen=2n+1������prelist���������Ľڵ�����Ϊn
//��������prelist[i],�������������ս�㣬��ֵΪNULLNODE��prelist����n+1��NULLNODE
#define NULLNODE -9999
bNode *buildBTreeByPrelist(int *prelist, int len)
{
	bNode *t;
	static int idx = 0; //�ݹ���ÿ�ε���������Ҫ���ʵġ����⡱�����þ�̬������ȫ�ֱ���
	if (prelist[idx] == NULLNODE)
	{
		idx++;
		return NULL;
	}
	if (!(t = (bNode *)malloc(sizeof(bNode *))))
		exit(0);
	t->data.value = prelist[idx];
	t->data.id = idx;
	idx++; //׼������prelist[idx]����һ�����ݹ������,idx�޷������β��б�
	t->lchild = buildBTreeByPrelist(prelist, len);
	t->rchild = buildBTreeByPrelist(prelist, len);
	return t;
} //���prelist�е������޷�ȫ�����뵽һ�ö���������μ�⣿����������� idx<len-1)
//ѧϰ�β��б����޷���ʾ������ġ�����ʱ��ʱ������ȫ�ֱ�����̬����������

//�ݹ��㷨(�������)����������� ��������������pre����������in���Լ��������и��Ե��Ͻ�pu,iu���½�pl,il
bNode *buildBTreeByPI(int *pre, int pl, int pu, int *in, int il, int iu)
{
	printf("\n%d-%d,%d-%d", pl, pu, il, iu);
	int il1, iu1, il2, iu2, pl1, pl2, pu1, pu2; //���ڵ���������зֳ����������У�ͬ���õ��������е����������У����������е��±�
	if (pu - pl != iu - il)
		exit(0); //����������
	if (pu - pl < 0)
		return NULL; //������Ϊ�գ����ؿս��/����
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
			iu2 = iu; //�����������in���и�
			pl1 = pl + 1;
			pu1 = pl + (iu1 - il1 + 1);
			pl2 = pu1 + 1;
			pu2 = pu; //�����������pre���и�
		}
	}
	t->lchild = buildBTreeByPI(pre, pl1, pu1, in, il1, iu1);
	t->rchild = buildBTreeByPI(pre, pl2, pu2, in, il2, iu2);
	return t;
}

/*** ��������������������  ***/
//���Ҹ������p�ĸ��ڵ� , t�ǿ�ʱ����ʾ�Ѿ��ҵ����Ͳ���Ҫ�ݹ���ã�ֱ�ӷ���
bNode *parent(bNode *root, bNode *p)
{
	bNode *t = NULL;
	if (!root || root == p)
		return p; //���޸��ڵ㣬����Ҳû��p�ĸ��ڵ�

	if (p && (root->lchild == p || root->rchild == p))
		return root;
	if (root->lchild && !t)
		t = parent(root->lchild, p);
	if (root->rchild && !t)
		t = parent(root->rchild, p);
	return t;
}

//�ɽ���id�����Ըĳ������������ֵ�����ҽ�㣬���ؽ��ָ�� ��(���������
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

//���ú���������������������������������ᶪʧ���ڵ�����Һ��ӡ�
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

/***-����Ĵ����ǽ����ʺ��� visit() �Ĳ�ͬʵ�ַ�ʽ��ʵ�ֶԵ������Ĵ���������ͨ����Ϊ���������������Ĳ��� ***/
//��ӡĳ��������Ϣ,����Elemtype�Ķ�����޸�,�򵥰汾��������洢��ַ��
void bPrintNode(bNode *a)
{
	printf("\n(id = %2d) = %5d", a->data.id, a->data.value);
}

//���Ժ���ֵ������������valueֵ+1
void add1(bNode *a)
{
	a->data.value += 1;
}

/***-����Ĵ�����ʵ�������������������ͺ��������ģ�壬������������Ĳ������ڶ����ǵ��޸� ***/
//�������������
void preTraverseTree(bNode *root, void (*ptrf)(bNode *a))
{
	if (root)
	{ //�ݹ����
		(*ptrf)(root);
		preTraverseTree(root->lchild, (*ptrf));
		preTraverseTree(root->rchild, (*ptrf));
	}
}

//�������������
void inTraverseTree(bNode *root, void (*ptrf)(bNode *a))
{
	if (root)
	{ //�ݹ����
		inTraverseTree(root->lchild, (*ptrf));
		(*ptrf)(root);
		inTraverseTree(root->rchild, (*ptrf));
	}
}

//�������������
void postTraverseTree(bNode *root, void (*ptrf)(bNode *a))
{
	if (root)
	{ //�ݹ����
		postTraverseTree(root->lchild, (*ptrf));
		postTraverseTree(root->rchild, (*ptrf));
		(*ptrf)(root);
	}
}

/***-����Ĵ�������������������������������������(��ʽ����)��ʽ��� ***/
//���¹���һ����ʽ���У���Ŷ������Ľ��ĵ�ַ�����ڲ������������
struct qNode
{						//���н��
	bNode *ptr;			//���еĽڵ�������������Ƕ���������ָ��
	struct qNode *next; //���е���һ����㣬�����ǵ�����
};

typedef struct queue
{
	struct qNode *front;
	struct qNode *rear;
} linkQueue;

//�Ӷ��������ɲ�������Ķ��У��ֲ���������������������������
//���ö��е��ɵ��������һ�Σ�����ʵ�ֲ������
//���㷨Ҳ���������޸ļ��õ�������������㷨������һ�£�
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

	struct qNode *head;												//�����������еĶ�ͷ(�����޸�hQueue->front����ֹ��ʧ)����βֱ����hQueue->rear
	struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //���������ڱ���㣨ͷ��㣬�������Ч���ݵĽ�㣩
	if (!t)
		exit(0);
	head = t; //��ʱ�ǿն���
	hQueue->rear = head;
	hQueue->front = hQueue->rear;
	//root���
	t = (struct qNode *)malloc(sizeof(struct qNode)); //�������н��
	if (!t)
		exit(0);
	t->ptr = root;			//������ֵ��ָ��next���Բ��ø�ֵ(why?)
	hQueue->rear->next = t; //head->next = t
	hQueue->rear = t;		//hQueue->rear != head, head->next = hQueue->rear
	while (head != hQueue->rear)
	{					   //���в��� ,head���ڱ���㣬������Ч����Ч���ݴ�head->next��ʼ
		head = head->next; //���ӣ�ģ����ӣ���ΪҪ�����������Ķ��У����Բ����޸Ķ��е�ͷָ��)
		//printf("de-%lx,%d\n", head->ptr, head->ptr->data.value); //��ӡ��䣬�����ã��鿴��ӡ����ӹ���

		if (head->ptr->rchild)
		{ //head������ݣ���㣩���Һ��ӷǿգ������¶��н�㣬���
			t = (struct qNode *)malloc(sizeof(struct qNode));
			if (!t)
				exit(0);
			t->ptr = head->ptr->rchild; //�½���������ֵ
			hQueue->rear->next = t;		//�½ڵ�ӵ�����β��
			hQueue->rear = t;
			//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value); //��ӡ��䣬�����ã��鿴��ӡ����ӹ���
		}
		if (head->ptr->lchild)
		{ //head->next������ݣ���㣩�����ӷǿգ������¶��н�㣬���
			t = (struct qNode *)malloc(sizeof(struct qNode));
			if (!t)
				exit(0);
			t->ptr = head->ptr->lchild; //�½���������ֵ
			hQueue->rear->next = t;		//�½ڵ�ӵ�����β��
			hQueue->rear = t;
			//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value); //��ӡ��䣬�����ã��鿴��ӡ����ӹ���
		}
	}
	return hQueue;
} //˼�����ʵ������/����/������������������������������Ķ���

//�������������
linkQueue *ToPreQueue(bNode *root, linkQueue *hQueue)
{
	if (!root)
		return hQueue;
	if (!hQueue->front)
	{
		struct qNode *head;												//�����������еĶ�ͷ(�����޸�hQueue->front����ֹ��ʧ)����βֱ����hQueue->rear
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //���������ڱ���㣨ͷ��㣬�������Ч���ݵĽ�㣩
		if (!t)
			exit(0);
		head = t; //��ʱ�ǿն���
		hQueue->rear = head;
		hQueue->front = hQueue->rear;

		//root���
		t = (struct qNode *)malloc(sizeof(struct qNode)); //�������н��
		if (!t)
			exit(0);
		t->ptr = root; //������ֵ��ָ��next���Բ��ø�ֵ(why?)
		hQueue->rear->next = t;
		hQueue->rear = t;
	}
	else
	{
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode));
		if (!t)
			exit(0);
		t->ptr = root;			//�½���������ֵ
		hQueue->rear->next = t; //�½ڵ�ӵ�����β��
		hQueue->rear = t;
		//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value);
	}
	hQueue = ToPreQueue(root->lchild, hQueue);
	hQueue = ToPreQueue(root->rchild, hQueue);
	return hQueue;
}

//�������������
linkQueue *ToInQueue(bNode *root, linkQueue *hQueue)
{
	if (!root)
		return hQueue;
	hQueue = ToInQueue(root->lchild, hQueue);
	if (!hQueue->front)
	{
		struct qNode *head;												//�����������еĶ�ͷ(�����޸�hQueue->front����ֹ��ʧ)����βֱ����hQueue->rear
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //���������ڱ���㣨ͷ��㣬�������Ч���ݵĽ�㣩
		if (!t)
			exit(0);
		head = t; //��ʱ�ǿն���
		hQueue->rear = head;
		hQueue->front = hQueue->rear;

		//root���
		t = (struct qNode *)malloc(sizeof(struct qNode)); //�������н��
		if (!t)
			exit(0);
		t->ptr = root; //������ֵ��ָ��next���Բ��ø�ֵ(why?)
		hQueue->rear->next = t;
		hQueue->rear = t;
	}
	else
	{
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode));
		if (!t)
			exit(0);
		t->ptr = root;			//�½���������ֵ
		hQueue->rear->next = t; //�½ڵ�ӵ�����β��
		hQueue->rear = t;
		//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value);
		//getchar();
	}
	hQueue = ToInQueue(root->rchild, hQueue);
	return hQueue;
}

//�������������
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
		struct qNode *head;												//�����������еĶ�ͷ(�����޸�hQueue->front����ֹ��ʧ)����βֱ����hQueue->rear
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode)); //���������ڱ���㣨ͷ��㣬�������Ч���ݵĽ�㣩
		if (!t)
			exit(0);
		head = t; //��ʱ�ǿն���
		hQueue->rear = head;
		hQueue->front = hQueue->rear;

		//root���
		t = (struct qNode *)malloc(sizeof(struct qNode)); //�������н��
		if (!t)
			exit(0);
		t->ptr = root; //������ֵ��ָ��next���Բ��ø�ֵ(why?)
		hQueue->rear->next = t;
		hQueue->rear = t;
	}
	else
	{
		struct qNode *t = (struct qNode *)malloc(sizeof(struct qNode));
		if (!t)
			exit(0);
		t->ptr = root;			//�½���������ֵ
		hQueue->rear->next = t; //�½ڵ�ӵ�����β��
		hQueue->rear = t;
		//printf("en-%lx,%d\n", t->ptr, t->ptr->data.value);
	}
	return hQueue;
}

/*** ������һЩ����Ӧ�� ***/
//��������ĸ߶�/���
int deepth(bNode *root)
{
	if (!root)
		return 0;
	int d = deepth(root->lchild);
	int n = deepth(root->rchild);
	return (d > n) ? d + 1 : n + 1;
}

//���������Ϊ2�Ľ����Ŀ
int node2(bNode *root)
{
	int c = 0;
	if (!root)
		return 0;
	if (root->lchild && root->rchild)
		c = 1;
	return c + node2(root->lchild) + node2(root->rchild);
}

//���������Ϊ1�Ľ����Ŀ
int node1(bNode *root)
{
	int c = 0;
	if (!root)
		return 0;
	if ((!root->lchild && root->rchild) || (root->lchild && !root->rchild))
		c = 1;
	return c + node1(root->lchild) + node1(root->rchild);
}

//���������Ϊ0�Ľ����Ŀ (Ҷ�ӽ����Ŀ��
int node0(bNode *root)
{
	if (!root)
		return 0;
	if (!root->lchild && !root->rchild)
		return 1;
	return node0(root->lchild) + node0(root->rchild);
}

//���������Ϊ0�Ľ����Ŀ��value֮��
int value0(bNode *root)
{
	if (!root)
		return 0;
	if (!root->lchild && !root->rchild)
		return root->data.value;
	return value0(root->lchild) + value0(root->rchild);
}

//ɾ��ĳ�ڵ㼰������
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
//ɾ���ڵ�value = x�Ľڵ㼰������
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
//����id1��id2��ͬ����
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
//����value����·��
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
//�ݹ������value����Сvalue֮��
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
					printf("%d, ", p->next->ptr->data.value); //��ӡ����������
				printf("\n");
				break;
			case 2:
				hQueue->front = NULL;
				hQueue->rear = NULL;
				qlist = ToInQueue(t1, hQueue);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //��ӡ����������
				printf("\n");
				break;
			case 3:
				hQueue->front = NULL;
				hQueue->rear = NULL;
				qlist = ToPreQueue(t1, hQueue);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //��ӡ����������
				printf("\n");
				break;
			case 4:
				hQueue->front = NULL;
				hQueue->rear = NULL;
				qlist = ToPostQueue(t1, hQueue);
				for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
					printf("%d, ", p->next->ptr->data.value); //��ӡ����������
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
	printf("\n���Զ��������� value:");
	bNode *t1 = buildBTreeByValue(val, n); //������ֵ�������ɶ�����
	preTraverseTree(t1, add1);			   //�����������
	inTraverseTree(t1, cPrintNode);		   //�����������
	postTraverseTree(t1, bPrintNode);	   //���Ժ�������
	//DestroyBTree(t1);

	printf("\n���Զ��������� edge :");//���ӱ�����
	bNode *t2 = buildBTreeByEdge(val, edge, n);
	cPrintNode(t2);					 //������ֵ����ͱ����ɶ�����
	preTraverseTree(t2, bPrintNode); //�����������
	inTraverseTree(t2, add1);		  //�����������
	postTraverseTree(t2, cPrintNode); //���Ժ�������
	//estroyBTree(t2);

	getchar();
	Find_Value(t1, 18);
	for (int i = N - 1; i >= 0; i--)
		cout << road[i] << endl;
	/*printf("\n���Զ��������� Prelist:");
	int prelist[15] = {17, 32, 41, -9999, -9999, -9999, 13, 7, -9999, -9999, 16, 22, -9999, -9999, -9999};
	bNode *t3 = buildBTreeByPrelist(prelist, 15);
	preTraverseTree(t3, cPrintNode); //�����������
	getchar();
	inTraverseTree(t3, cPrintNode); //�����������
	getchar();
	postTraverseTree(t3, bPrintNode); //���Ժ�������

	//���Բ���������
	saveTree(t1, "sg.html");
	saveTree(t2, "test.html");
	printf("\n���Բ���������:");
	linkQueue *hQueue = (linkQueue *)malloc(sizeof(linkQueue));
	hQueue->front = NULL;
	hQueue->rear = NULL;
	linkQueue *qlist = ToHiraQueue(t2);
	for (struct qNode *p = qlist->front; p != qlist->rear; p = p->next)
		getchar(), printf("%d, ", p->next->ptr->data.value); //��ӡ����������
	printf("\n");

	getchar();
	cout << Sub_Max(t1, t2, 0) << endl;
	//���Խ����Һ��󸸽ڵ�
	/*printf("\n���Խ����Һ��󸸽ڵ�:");
	bNode *tn = locateByID(t2, 2);
	if (!tn)
		printf("\nû�ҵ����");
	else
	{
		cPrintNode(tn);
		printf("\n���ڵ�Ϊ��");
		tn = parent(t2, tn);
		if (!tn)
			printf("û�ҵ�");
		else
			cPrintNode(tn);
	}
	DestroyBTree(t2);
	getchar();*/

	//�����������к��������й��������
	/*printf("\n���Զ��������� PI:");
	int pre[] = {17, 32, 41, 13, 7, 16, 22};
	int in[] = {41, 32, 17, 7, 13, 22, 16};
	bNode *t1 = buildBTreeByPI(pre, 0, 6, in, 0, 6);
	getchar();
	if (t1)
	{
		preTraverseTree(t1, cPrintNode); //�����������
		getchar();
		inTraverseTree(t1, cPrintNode); //�����������
		getchar();
		postTraverseTree(t1, cPrintNode); //���Ժ�������
	}

	//����Ӧ�ò���
	printf("\n���߶� %d ", deepth(t1));
	printf("\n����Ϊ2�Ľ����Ŀ %d ", node2(t1));
	printf("\n����Ϊ0�Ľ����Ŀ %d ", node0(t1));
	printf("\n����Ϊ1�Ľ����Ŀ %d ", node1(t1));
	printf("\n����Ϊ0�Ľ��value֮�� %d ", value0(t1));

	DestroyBTree(t1);*/

	return 1;
}

#endif
