#ifndef _NETWORK_CPP_
#define _NETWORK_CPP_
//ͼ/�����ʵ��: ����ָ�룬�����ɴ�������ʵ�֣�ͼ��˳��洢��ʽ��
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//����ͼ����󶨵�����������
#define MAXV 100
#define MAXE 20000

//����ṹ��
typedef struct{
	int id;  						//������
	int w;  	 					//����Ȩֵ
	int degree;						//�����(���ȣ���,Ҳ��edges[]����ЧԪ�ظ���
	long edges[MAXV];  				//�ߵı��
} Vertex;

//��/�����ṹ��
typedef struct{
	long id;   						//�����
	int h,t; 						//h:��ͷ��� id, t:��β��� id
	int w;   						//weight of edge
} Edge;

//����ͼ�ṹ�壺����ͼ�Ļ�����Ϣ�����бߵĻ�����Ϣ
//���ж���Ļ�����Ϣ��ÿ���������������������Ϣ��������Ϊ�ڽӱ��һ��ʵ�֣�
typedef struct{
	Vertex v[MAXV];		//��������
	Edge e[MAXE];       //������,����ѯ��
	bool directional; 	//t������ͼ��f������ͼ
	bool weighted;		//t����Ȩͼ��f����Ȩͼ
	unsigned nv;      	//ͼ��ʵ�ʶ�����
	unsigned long ne;  	//ͼ��ʵ�ʱ���
	//bool available_v[MAXV]; //�����Ч�Ķ��� ������ʵ�ָ�Ч�汾�Ĳ��롢ɾ�����㣬���ڿ������ݱ�Ų��Ҷ������Ϣ
	//bool available_e[MAXE]; //�����Ч�ı� ,����ʵ�ָ�Ч�汾�Ĳ��롢ɾ���ߣ����ڿ������ݱ�Ų��ұߵ���Ϣ
							  //��Ч�汾������id�Ͷ���������±꣬��������±걣��һ�£���ɾ���߻򶥵�ʱ��������������Ӧλ������Ϊfalse
							  //������Ϣʱֱ�����±꣬���Ӷ�����ʱ��ͷ��ʼ����һ��Ϊʹ�õ�λ�ò��뼴��
} Graph;

#include "showgt.h"

//С���ߣ����ͼ�����������ɱ߱�洢���ļ�filename��
//����һ�����ͼ����n�����㣬ÿ������������κζ������ߵĸ���Ϊp
int randGenGraph(int n, float p, bool weighted, bool directional, const char *filename, int seed){
	srand(seed);//ȷ�����ɵ�ͼ��������
	//�����ļ����ݣ��ļ���С������5Mbytes�����ϰ�������ɵ�ͼ��Ϣд���ַ���content��
	char *content=(char *)malloc(5000000);
	if (!content){
		printf("����洢�ռ�ʧ��\n");
		exit(0);
	}
	FILE *fp = fopen(filename,"wb");
	if (!fp){
		printf("����ͼ�ļ� %s ʱ����!\n",filename);
		exit(0);
	}

	long offset = 0; //content��ǰ��д��λ��
	long ne = 0; //���ɱ���
	
	for(int i=0;i<n;++i)
		offset += sprintf(content+offset,"%3d %5d\n",i,rand()%100);//д����ı���Լ�������Ȩֵ
	
	int pn = (int)(10000*p);
	if (directional){//����ͼ
		for(int i=0;i<n;++i) //д�������
			for(int j=0;j<n;++j)
				 if (i!=j && rand()%10000<pn){
			 		offset += sprintf(content+offset,"%3d  %3d  %4d\n",i,j, weighted?rand()%100:1);
			 		ne++;
			 	}
	}else{//����ͼ
		for(int i=0;i<n;++i) //д�������
			for(int j=i+1;j<n;++j)
				 if (rand()%10000<pn){
			 		offset += sprintf(content+offset,"%3d  %3d  %4d\n",i,j, weighted?rand()%100:1);
			 		ne++;
			 	}
	}
	
	char ch[40];
	int sz = sprintf(ch,"%3d %7d %5s %5s\n",n,ne,weighted?"true":"false",directional?"true":"false");
	fwrite(&ch,sz,1,fp);	//д��ͼ�Ķ�����Ŀ�ͱߵ���Ŀ
	fwrite(content,offset,1,fp); //д��ͼ�Ķ���ͱ���Ϣ
	fclose(fp);
	free(content);
}

//���ļ��ж���ͼ�����ڴ�������ͼ�ı�ʾ
void initGraph(Graph *g,const char *gfile){
	FILE *fp = fopen(gfile,"r");
	if (!fp){
		printf("��ȡͼ�����ļ�����\n");
		exit(0);
	}

	char bv[10];
	//��ȡͼ�Ļ�����Ϣ ,ͼ�����ͣ���������������
	fscanf(fp,"%u%lu%s",&(g->nv),&(g->ne),bv);
	g->weighted = strcmp(bv,"true")==0?true:false;
	fscanf(fp,"%s",bv);
	g->directional = strcmp(bv,"true")==0?true:false;
	
	//��ȡ������Ϣ��id��w��degree�� û�� edges��������Ϣʱ���ϣ�
	for (int i=0;i<g->nv;++i){
		fscanf(fp,"%d%d",&(g->v[i].id),&(g->v[i].w));
		g->v[i].degree = 0;
		//printf("���� %d - Ȩ %d\n",g->v[i].id,g->v[i].w);
	}
	
	//��ȡ����Ϣ��  g.e[i]: id,h,t,w; ͬʱÿ����Ҫ�޸Ķ����edges��degree
	for(unsigned long i=0;i<g->ne;++i){
		fscanf(fp,"%u%u%d",&(g->e[i].t),&(g->e[i].h),&(g->e[i].w));
		printf("��:%u->%u => %d\n",g->e[i].t,g->e[i].h,g->e[i].w);
		g->e[i].id = i;
		unsigned h,t;
		h = g->e[i].h;							//���Ϊi�ıߣ���ͷh����βt
		t = g->e[i].t;
		g->v[t].edges[g->v[t].degree++] = i;  	//��β����t�ĳ��߱��¼�ߵı��i
		if (g->directional==false)      		//����ͼ�Ļ�ͷ����h�ı߱�ҲҪ��¼�߱��i
			g->v[h].edges[g->v[h].degree++]=i;  //����Ķ�ҲҪ+1
	}
	fclose(fp);
}

//��ӡ�ڽӱ����Ϣ
void printG(Graph *g){
	printf("ͼ�Ļ�����Ϣ��������(%u)-����(%ul)-%s-%s\n",g->nv,g->ne,g->weighted?"��Ȩͼ":"��Ȩͼ",g->directional?"����ͼ":"����ͼ");
	for(int i=0;i<g->nv;++i){
		printf("ID(%u)-��(%d)-Ȩ(%d)-���� t(eid|w)��%u ",g->v[i].id,g->v[i].degree,g->v[i].w, g->v[i].id);
		for(int j=0;j<g->v[i].degree;++j){
			unsigned long e = g->v[i].edges[j];
			printf("-> %u(%d-%d) ",g->e[e].t,g->e[e].id,g->e[e].w);
		}
		printf("\n");
	}
}

//��ͼ�Ķ���id�Ҷ���������±�,��Ч�ʰ汾
inline int getVexIdx(Graph *g,int id){
	for(int i=0;i<g->nv;++i)
		if (g->v[i].id == id)
			return i;
	printf("input wrong vertex id in getVexIdx()!\n");
	exit(0);
}

//���Ҹ�����ŵĶ��㣬������Ȩֵ .  inline �������������ʱ��ֱ��չ�� ����Ч��ʵ�ְ汾
inline int getVexW(Graph *g, int id){
 	for(int i=0;i<g->nv;++i)
 		if (g->v[i].id == id)
			return g->v[id].w;
	printf("input wrong vertex id in getVexW()!\n");
	exit(0);
}

//���Ҹ�����ŵĶ��㣬������� ����Ч��ʵ�ְ汾 �����������id�ұ߻�Ȩ��ĳЩ��Ϣ�����ǵ�Ч�汾������һ�α��������ߵ�ѭ��
inline int getVexDegree(Graph *g, int id){
	for(int i=0;i<g->nv;++i)
		if (g->v[i].id == id)
			return g->v[id].degree;
	printf("input wrong vertex id in getVexDegree()!\n");
	exit(0);
}

//ͨ��Ȩֵ���Ҷ�����
inline int locateVex(Graph *g, int w){
	for(int i=0;i<g->nv;i++)
		if (g->v[i].w == w)
			return g->v[i].id;
	return -1;
}

//ͨ����Ȩֵ���ұߵı��
inline long locateEdge(Graph *g,int w){
	for(int i=0;i<g->ne;++i)
		if (g->e[i].w == w)
			return g->e[i].id;
	return -1;
}

//���ұߵ�Ȩֵ����Ч��ʵ�ְ汾
inline int getEdgeW(Graph *g,long id){
	for(int i=0;i<g->ne;++i)
		if (g->e[i].id == id)
			return g->e[i].w;
	printf("input wrong edge id in getEdgeW()!\n");
	exit(0);
}

//���ұߵ��±꣬��Ч��ʵ�ְ汾
inline int getEdgeIdx(Graph *g,long id){
	for(int i=0;i<g->ne;++i)
		if (g->e[i].id == id)
			return i;
	printf("input wrong edge id in getEdgeIdx()!\n");
	exit(0);
}

//���رߵ��������㣬��Ч��ʵ�ְ汾
inline void getVex2ByEdge(Graph *g, long id,int *h,int *t){
	for(int i=0;i<g->ne;++i)
		if (g->e[i].id == id){
			*h = g->e[i].h;
			*t = g->e[i].t;
		}
	printf("input wrong edge id in getVer2ByEdge()!\n");
	exit(0);
}

//���Ҷ�������б�,���ر���Ϊ*ne���ͱ�������׵�ַ ����Ч�ʰ汾
inline long *getEdgesByNode(Graph *g,int id, int *ne){
	for(int i=0;i<g->nv;++i)
		if (g->v[i].id == id){
			*ne = g->v[i].degree;
			return g->v[i].edges;
		}
	printf("input wrong vertex id in getEdgesByNode()!\n");
	exit(0);
}

//���ö���Ȩֵ ����Ч�ʰ汾
inline void setVexW(Graph *g,int id, int w){
	for(int i=0;i<g->nv;++i)
		if (g->v[i].id == id)
			g->v[i].w = w;
	printf("input wrong vertex id in setVexW()!\n");
	exit(0);
}

//���ñ�Ȩֵ ����Ч�ʰ汾
inline void setEdgeW(Graph *g,int id, int w){
	for(int i=0;i<g->ne;++i)
		if (g->e[i].id == id)
			g->e[i].w = w;
	printf("input wrong edge id in setEdgeW()!\n");
	exit(0);
}

//����һ����
void addEdge(Graph *g, int h, int t, int w){
	if (h<0 || t <0 || h>=g->nv || t>=g->nv){
		printf("wrong vertex id in addEdge()!\n");
		exit(0);
	}
	//�޸ı�����
	long ne = g->ne;
	g->e[ne].h = h;
	g->e[ne].t = t;
	g->e[ne].w = w; 		//���ñ�Ȩֵ
	g->e[ne].id = ne; 	//���ñ�id
	g->ne += 1;
	//�޸�ͷβ��������
	g->v[h].edges[g->v[h].degree++]=ne;
	if (g->directional==false)
		g->v[t].edges[g->v[t].degree++]=ne; //����ͼ��Ҫ�޸Ļ�β������Ϣ
}

//������һ�����㣬ֻ��һ�������Ķ���
void addVex(Graph *g, int w){
	g->v[g->nv].id = g->nv;
	g->v[g->nv].w = w;
	g->v[g->nv].degree = 0;
}

//ɾ��ָ��id�ı� ��������������һ�����ƶ���g->e���鱻ɾ����λ��
void deleteEdge(Graph *g, int id){
	for(int i=0;i<g->ne;++i)
		if (g->e[i].id == id){
			g->ne--;
			int ne = g->ne;
			int h = g->e[i].h;
			int t = g->e[i].t;
			g->e[i].h = g->e[ne].h;
			g->e[i].t = g->e[ne].h;
			g->e[i].id = g->e[ne].id;
			g->e[i].w = g->e[ne].w;
			for(int j=0;j<g->v[h].degree;j++)
				if (g->v[h].edges[j]==id)
					g->v[h].edges[j] = g->v[h].edges[--(g->v[h].degree)];
			if (g->directional==false){//����ͼ����Ҫɾ��β���ı�
				for(int j=0;j<g->v[t].degree;j++)
					if (g->v[t].edges[j]==id)
						g->v[t].edges[j] = g->v[t].edges[--(g->v[t].degree)];
			}
		}
	printf("wrong edge id in deleteEdge()!\n");
	exit(0);
}

//ɾ������
void deleteVex(Graph *g,int id){
	for(int i=0;i<g->nv;++i)
		if (g->v[i].id == id){
			for (int j=0;j<g->v[i].degree;++j){
				int eid = g->v[i].edges[j];
				deleteEdge(g,eid);
			}//ɾ������id�����б�
			//ɾ�����㱾��,�����һ������ƶ��������ǵ�i�����
			int nv = g->nv-1;
			g->v[i].id = g->v[nv].id;
			g->v[i].w = g->v[nv].w;
			g->v[i].degree = g->v[nv].degree;
			for(int j=0;j<g->v[i].degree;++j)
				g->v[i].edges[j]= g->v[nv].edges[j];
			g->nv--;
		}

	printf("wrong vertex id in deleteVex()!\n");
	exit(0);
}

int main(){
	int seed = 121;
	randGenGraph(20,0.2,false,true,"g1.txt",seed);
	Graph *g = (Graph *)malloc(sizeof(Graph));

	printf("size of g = %ld\n",sizeof(Graph));
	initGraph(g,"g1.txt");
	printG(g);
	saveGraph(g,"sg.html");
}


#endif
