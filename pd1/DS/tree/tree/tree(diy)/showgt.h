#ifndef _SHOWGT_CPP_
#define  _SHOWGT_CPP_

#include <stdlib.h>
#include <stdio.h>

//��������������bitree.cpp�ļ��вŻ���Ч�������� 
#ifdef _BITREE_CPP_

/*** ���´������ڽ�������������д���ļ���Ȼ�������������Ϊfilename�ļ����ɲ鿴��/ͼ ***/
//��������������ı����ļ�fp,���ʱvalue���Ըĳ�id��Lc��Rc�ֱ��ʾ���ϵ�Ȩֵ���������ڱ�ʶ���Һ��� 
//source: %d ���ڵ���Ϣ�� target: %d �ӽڵ���Ϣ; rela: xx ����Ȩֵ��Ϣ�� type: resolved �ô������ 
void writeTree(bNode *root,FILE *fp){
	if (root){
		if (root->lchild){ 
			fprintf(fp,"{source: '%d', target: '%d', 'rela': 'Lc', type: 'resolved'},\n",root->data.value,root->lchild->data.value); 
			writeTree(root->lchild,fp);
		}
		if (root->rchild){
			fprintf(fp,"{source: '%d', target: '%d', 'rela': 'Rc', type: 'resolved'},\n",root->data.value,root->rchild->data.value);
			writeTree(root->rchild,fp);
		}
	}
} 

//���ô˺�����������filename�ļ�(�ļ�����.html��β������chrome������鿴 
void saveTree(bNode *root,const char filename[]){
	FILE *fp = fopen(filename,"wb");
	if (!fp) {
		printf("��д���ļ�����\n");
		exit(0);
	} 
	
	//��ȡͷ���ļ��������Ʒ�ʽд��filename�ļ� 
	FILE *fh = fopen("head.txt","rb");
	fseek(fh,0,SEEK_END); 
	long fsize = ftell(fh); 
	rewind(fh);
	unsigned char *dataArray;
	dataArray = (unsigned char *)malloc(sizeof(unsigned char)*fsize);
	if (!dataArray) {
		printf("�ļ�̫���ڴ治�����������!\n");
		exit(0);
	}
	fread(dataArray,sizeof(unsigned char),fsize,fh); //��ȡ�ļ�
	fwrite(dataArray, sizeof(unsigned char),fsize,fp);//д���ļ� 
	free(dataArray);
	fclose(fh);
	
	//��������Ϣд��filename�ļ� 
	fprintf(fp,"\n\nvar links = \n[\n");
	writeTree(root,fp);
	fprintf(fp,"\n];");
	
	//��ȡβ���ļ��������Ʒ�ʽд��filename�ļ� 
	fh = fopen("tail.txt","rb");
	fseek(fh,0,SEEK_END); 
	fsize = ftell(fh); 
	rewind(fh);
	dataArray = (unsigned char *)malloc(sizeof(unsigned char)*fsize);
	if (!dataArray) {
		printf("�ļ�̫���ڴ治�����������!\n");
		exit(0);
	}
	fread(dataArray,sizeof(unsigned char),fsize,fh); //��ȡ�ļ�
	fwrite(dataArray, sizeof(unsigned char),fsize,fp);//д���ļ� 
	free(dataArray);
	fclose(fh);
	
	fclose(fp);
}
#endif

//��������������humantree.cpp�ļ��вŻ���Ч�ͱ����� 
#ifdef _HUFFMANTREE_CPP_
void writeTree(HTNode t[],int ridx,FILE *fp){
	if (ridx>=0 && t[ridx].w>0){
		if (t[ridx].lchild>=0){ 
			fprintf(fp,"{source: '%d-%d', target: '%d-%d', 'rela': '0', type: 'resolved'},\n",ridx,t[ridx].w,t[ridx].lchild,t[t[ridx].lchild].w); 
			writeTree(t,t[ridx].lchild,fp);
		}
		if (t[ridx].rchild>=0){
			fprintf(fp,"{source: '%d-%d', target: '%d-%d', 'rela': '1', type: 'resolved'},\n",ridx,t[ridx].w,t[ridx].rchild,t[t[ridx].rchild].w);
			writeTree(t,t[ridx].rchild,fp);
		}
	}
} 

//���ô˺�����������filename�ļ�(�ļ�����.html��β������chrome������鿴 
void saveTree(HTNode root[],int rt,const char filename[]){
	FILE *fp = fopen(filename,"wb");
	if (!fp) {
		printf("��д���ļ�����\n");
		exit(0);
	} 
	
	//��ȡͷ���ļ��������Ʒ�ʽд��filename�ļ� 
	FILE *fh = fopen("head.txt","rb");
	fseek(fh,0,SEEK_END); 
	long fsize = ftell(fh); 
	rewind(fh);
	unsigned char *dataArray;
	dataArray = (unsigned char *)malloc(sizeof(unsigned char)*fsize);
	if (!dataArray) {
		printf("�ļ�̫���ڴ治�����������!\n");
		exit(0);
	}
	fread(dataArray,sizeof(unsigned char),fsize,fh); //��ȡ�ļ�
	fwrite(dataArray, sizeof(unsigned char),fsize,fp);//д���ļ� 
	free(dataArray);
	fclose(fh);
	
	//��������Ϣд��filename�ļ� 
	fprintf(fp,"\n\nvar links = \n[\n");
	writeTree(root,rt,fp);//m��Ҫ�޸ģ����256���ַ�û��ȫ������ 
	fprintf(fp,"\n];");
	
	//��ȡβ���ļ��������Ʒ�ʽд��filename�ļ� 
	fh = fopen("tail.txt","rb");
	fseek(fh,0,SEEK_END); 
	fsize = ftell(fh); 
	rewind(fh);
	dataArray = (unsigned char *)malloc(sizeof(unsigned char)*fsize);
	if (!dataArray) {
		printf("�ļ�̫���ڴ治�����������!\n");
		exit(0);
	}
	fread(dataArray,sizeof(unsigned char),fsize,fh); //��ȡ�ļ�
	fwrite(dataArray, sizeof(unsigned char),fsize,fp);//д���ļ� 
	free(dataArray);
	fclose(fh);
	
	fclose(fp);
}	
	
#endif

 
#endif 
