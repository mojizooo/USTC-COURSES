#include <stdio.h>
#include <stdlib.h>

#define ElemType int //ʹ�ú궨������滻��ͬ�������� 

#define _DEBUG_ 1    //ʹ�ú궨���Բ���/���ε�����Ϣ


typedef struct Lnode
{   //����ṹ�壬�����������ݺͽ��
	ElemType data;       
	struct Lnode * next; 
	
} LinkNode, * LinkList;  //���峣���ͱ�����ָ���ͱ���

LinkNode *first;         //����ͷ���

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
	//��������
	LinkNode *p = (LinkNode *)malloc(sizeof(LinkNode)); //��ʼ��ͷ��㼰����ռ�
	if (!p) {
		//�������ʧ�����˳�����
		printf("��ʼ������ͷ���ʧ�ܣ�\n");
		exit(0);
	}
	p->next = NULL;   //ʹͷ������һ�����Ϊ�գ��������Ұָ�룩
	return p;
}

#ifdef _DEBUG_  //�����Դ������������ַָ���

LinkNode head;


void initList1(LinkNode *p){
	//��һ����������ʽ
	p = (LinkNode *)malloc(sizeof(LinkNode));
	if (!p) {
		printf("��ʼ������ͷ���ʧ�ܣ�\n");
		exit(0);
	}
	p->next = NULL;
}

void initList2(){
	//��һ����������ʽ
	first = &head;
	first->next = NULL;
}
#endif

int ListLength(LinkList p){
	//��������Ԫ����Ŀ��������
	int count = 0;
	while (p->next!=NULL){
		//����ǿ������ָ��
		count++;
		p = p->next;
	}
	return count;
}

int ListEmpty(LinkList p){
	//�ж������Ƿ�Ϊ��
	if (p->next!=NULL)
		return 1;
	return 0;
}

void ClearList(LinkList p){
	//�������
	LinkNode *q; //��ʱ����ָ�����ڼ̳б�ɾ�����ĺ�������
	while(p->next!=NULL){
		q = p->next;
		q->next = q->next;
		free(q); //�ͷŽ��
	}
}

void DestroyList(LinkList p){
	//ɾ������
	ClearList(p);
	free(p); //�ͷ�Ŀ����
}

int GetElem(LinkList p, int i, ElemType *e){
	//��ȡ������Ԫ��
	int k = 0;
	while(p){
		k++;
		if (k == i){//����ҵ�Ŀ����
			*e = p->data;
			return k;
		}
		p = p->next;
	}
	return 0;
}

LinkNode *LocateElem(LinkList p, ElemType e){
	//��ѰĿ��Ԫ�ص�λ�ã�ֻ���ҵ������ǰ��Ԫ�أ�
	while(p){
		if (p->data == e) //����ҵ��򷵻���Ӧָ��
			return p;
		p = p->next;
	}
	return NULL;
}

LinkNode *PriorElem(LinkList p, LinkNode *cur_e){
	//��ѰĿ����ĸ��ڵ�
	for (;p->next;p = p->next) //��forѭ������whileѭ�����ӽ��ǿ����������
		if (p->next == cur_e)
			return p;          //����ҵ��򷵻��丸���
	return NULL;
}

LinkNode *NextElem(LinkList p, LinkNode *e){
	//��Ѱ��ǰ�����ӽ��
	return e->next;
}
LinkNode *ListInsert(LinkList p, int i, ElemType e){
	//�������в���Ԫ��
	if (i < 1) return NULL; //������벻�Ϸ��򷵻ؿ�ָ��
	for (;p;p = p->next)    //��ǰ��㲻Ϊ�����������
		if (--i < 1){       //�������Ŀ��λ��
			LinkNode *q = (LinkNode *)malloc(sizeof(LinkNode)); //��ʼ���½�㼰����ռ�
			if (!q) {
				printf("����ڵ�ʱ������ռ�ʧ�ܣ�\n");
				exit(0);	
			}
			//�����½��
			q->next = p->next;
			p->next = q;
			q->data = e;
			return q;		//�����½��
		}
	return NULL;
}

int ListDelete(LinkList p, int i, ElemType *e){
	//ɾ��������Ŀ����ͬʱȡ����������Ԫ��
	if (i < 1) return 0; //���벻�Ϸ�����0������ɾ��ʧ��
	LinkNode *q = p;
	for(p = p->next;p;p = p->next){
		if (--i < 1){    //�������Ŀ��λ��
			q->next = p->next;
			*e = p->data;
			free(p); 	 //��ʱ����q = p�ʲ���free(q)
			return 1;    //����1������ɾ���ɹ�
		}
		q = p;			 //��δ����������̳е�ǰ��������һ�α���
	}
	return 0;
}

void PrintLinkNode(LinkNode *p){
	//���Ŀ����Ԫ��
	printf("%d,", p->data);
}

void Add2(LinkNode *p){
	//Ŀ����Ԫ����ֵ+2
	p->data += 2;
	printf("+2,");
}

void DebugLinkNode(LinkNode *p){
	//����Ŀ����
	printf("���-(*addr)=value:");
	printf("((*%p)=%d\n", p, p->data);
}

void ListTraverse(LinkList p,void (*ptrFunc)(LinkNode *ptr)){
	//��������
	printf("����(��=%d)��", ListLength(p));
	while (p){
		//p�ǿ����p���д��ݽ����ĺ�������
		(*ptrFunc)(p);
		p = p->next;
	}
	printf("\n");
}

int main(){

	void (*ptrFunc)(LinkNode *p) = DebugLinkNode; //���庯��ָ��

	first = initList(); //����ͷ���

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
	printf("ȡ����֮ǰ%d --", ei);
	GetElem(first, 10, &ei);  //��ei�ĵ�ַ�ж��������е�����
	printf("��ȡ������Ϊ%d \n", ei);

	LinkNode *q = LocateElem(first,888);
	if (!q)
		printf("û�ҵ�ֵ����Ӧ�Ľ��\n" );
	else{
		q = PriorElem(first,q);
		printf("�ҵ�����ǰ��Ϊ%d -- ", q->data);
		printf("�ҵ����Ϊ%d -- ", q->next->data);
		if (q->next->next) //�����ǰ�����ӽ��ǿ�
			printf("�ҵ����ĺ��Ϊ%d ", NextElem(first,NextElem(first, q))->data);
		printf("\n" );
	}

	printf("ɾ��ǰ��ֵ%d -- ", ei);
	if (ListDelete(first, 1, &ei) > 0)
		printf("ɾ����ֵΪ%d\n", ei);
	else
		printf("ɾ��ʧ��%d \n", ei);

	ListTraverse(first, ptrFunc);
	printf("ɾ��ǰ��ֵ%d -- ", ei);
	if (ListDelete(first, 10, &ei) > 0)
		printf("ɾ����ֵΪ%d\n", ei);
	else
		printf("ɾ��ʧ��%d \n", ei);

	printf("ɾ��ǰ��ֵ%d -- ", ei);
	if (ListDelete(first, 6, &ei) > 0)
		printf("ɾ����ֵΪ%d\n", ei);
	else
		printf("ɾ��ʧ��%d \n", ei);
	ListTraverse(first,ptrFunc);

	ptrFunc = Add2;
	printf("ÿ������Ԫ��׼��+2\n" );
	ListTraverse(first,ptrFunc);
	printf("���+2���µ�����:");
	ListTraverse(first,PrintLinkNode);


	DestroyList(first);

	return 0;
}