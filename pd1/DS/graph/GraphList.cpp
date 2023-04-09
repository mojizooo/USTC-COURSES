
#include <iostream>
using namespace std;
#include <string.h>

#define INFINITY 1000
#define MAX_VERTEX_NUM 20

typedef struct ArcNode
{
    int adjvex;
    int w;
    struct ArcNode *nextarc;
} ArcNode;

typedef struct VNode
{
    int vex;
    int w;
    ArcNode *firstarc;
} VNode, AdjList[MAX_VERTEX_NUM];

typedef struct ALGraph
{
    AdjList vexs;
    int vexnum, arcnum;
} ALGraph;

#include "showgt.h"

ALGraph *creategraph(ALGraph *g)
{
    g->vexnum = 0;
    g->arcnum = 0;
    return g;
}

int LocateVex(ALGraph *g, int x)
{
    for (int k = 0; k < g->vexnum; k++)
        if (g->vexs[k].vex == x)
            return k;
    return -1;
}

void print(ALGraph *g, int x)
{
    int i = LocateVex(g, x);
    ArcNode *p = g->vexs[i].firstarc;
    while (p)
    {
        cout << x << "->" << p->adjvex << "->" << p->w << endl;
        p = p->nextarc;
    }
}

int AddArc(ALGraph *g, int a, int b, int w)
{
    int i = LocateVex(g, a);
    ArcNode *p;
    p = (ArcNode *)malloc(sizeof(ArcNode));
    p->adjvex = b;
    p->nextarc = g->vexs[i].firstarc;
    g->vexs[i].firstarc = p;
    g->vexs[i].firstarc->w = w;
    return 1;
}

int DelArc(ALGraph *g, int a, int b)
{
    int i = LocateVex(g, a);
    int j = LocateVex(g, b);
    ArcNode *p = g->vexs[i].firstarc;
    if (!p)
        return 0;
    ArcNode *q = p;
    if (p->adjvex == j)
    {
        g->vexs[i].firstarc = NULL;
        return 1;
    }
    while (p->nextarc)
    {
        if (p->nextarc->adjvex == j)
        {
            p->nextarc = p->nextarc->nextarc;
            break;
        }
        p = p->nextarc;
    }
    g->arcnum--;
    return 1;
}

int AddVertex(ALGraph *g, int x)
{
    if (g->vexnum + 1 == MAX_VERTEX_NUM)
        return -1;
    if (LocateVex(g, x) != -1)
        return -1;

    g->vexs[g->vexnum].vex = x;
    g->vexs[g->vexnum].firstarc = NULL;
    return ++g->vexnum;
}

int DelVex(ALGraph *g, int x)
{
    int pos = LocateVex(g, x);
    for (int i = 0; i < g->vexnum; i++)
    {
        if (i != pos)
        {
            DelArc(g, g->vexs[i].vex, x);
        }
    }
    for (int i = pos; i < g->vexnum - 1; i++)
    {
        g->vexs[i].w = g->vexs[i + 1].w;
        g->vexs[i].vex = g->vexs[i + 1].vex;
        g->vexs[i].firstarc = g->vexs[i + 1].firstarc;
    }

    g->vexnum--;
}

int Merge(ALGraph *g, int a, int b)
{
    DelArc(g, a, b);
    DelArc(g, b, a);
    int i = LocateVex(g, a);
    int j = LocateVex(g, b);
    for (int k = 0; k < g->vexnum; k++)
    {
        if (k == j)
        {
            ArcNode *p = g->vexs[j].firstarc;
            while (p)
            {
                AddArc(g, i, p->adjvex, p->w);
                p = p->nextarc;
            }
        }
        else
        {
            ArcNode *p = g->vexs[k].firstarc;
            while (p)
            {
                if (p->adjvex == b)
                {
                    AddArc(g, g->vexs[k].vex, a, p->w);
                    break;
                }
                p = p->nextarc;
            }
        }
    }
    DelVex(g, b);
}

int randGenGraph(int n, float p, const char *filename, int seed)
{
    srand(seed); //确保生成的图可以重现
    //保存文件内容，文件大小不超过5Mbytes，不断把随机生成的图信息写入字符串content中
    char *content = (char *)malloc(5000000);
    if (!content)
    {
        printf("分配存储空间失败\n");
        exit(0);
    }
    FILE *fp = fopen(filename, "wb");
    if (!fp)
    {
        printf("生成图文件 %s 时出错!\n", filename);
        exit(0);
    }

    long offset = 0; // content当前的写入位置
    long ne = 0;     //生成边数

    for (int i = 0; i < n; ++i)
        offset += sprintf(content + offset, "%3d\n", i); //写入结点的编号以及结点随机权值

    int pn = (int)(10000 * p);
    //有向图
    for (int i = 0; i < n; ++i) //写入随机边
        for (int j = 0; j < n; ++j)
            if (i != j && rand() % 10000 < pn)
            {
                offset += sprintf(content + offset, "%3d  %3d  %4d\n", i, j, rand() % 100);
                ne++;
            }

    char ch[40];
    int sz = sprintf(ch, "%3d %7d\n", n, ne);
    fwrite(&ch, sz, 1, fp);         //写入图的顶点数目和边的数目
    fwrite(content, offset, 1, fp); //写入图的顶点和边信息
    fclose(fp);
    free(content);
}

void initGraph(ALGraph *g, const char *gfile)
{
    FILE *fp = fopen(gfile, "r");
    if (!fp)
    {
        printf("读取图数据文件出错\n");
        exit(0);
    }

    //读取图的基本信息 ,图的类型，顶点数，边数等
    fscanf(fp, "%u%lu", &(g->vexnum), &(g->arcnum));

    //读取顶点信息：id，w，degree； 没有 edges（读边信息时加上）
    for (int i = 0; i < g->vexnum; ++i)
    {
        fscanf(fp, "%d", &(g->vexs[i].vex));
        g->vexs[i].firstarc = NULL;
        // printf("顶点 %d - 权 %d\n",g->v[i].id,g->v[i].w);
    }

    //读取边信息：  g.e[i]: id,h,t,w; 同时每条边要修改顶点的edges和degree
    for (unsigned long i = 0; i < g->arcnum; ++i)
    {
        int a, b, w;
        fscanf(fp, "%u%u%d", &a, &b, &w);
        AddArc(g, a, b, w);
    }
    fclose(fp);
}

void writeGraph(ALGraph *g, FILE *fp)
{
    for (int i = 0; i < g->vexnum; ++i)
    {
        ArcNode *p;
        p = g->vexs[i].firstarc;
        while (p)
        {
            fprintf(fp, "{source: '%d', target: '%d', 'rela': '%d', type: 'resolved'},\n", g->vexs[i].vex, p->adjvex, p->w);
            p = p->nextarc;
        }
    }
}

void saveGraph(ALGraph *g, const char filename[])
{
    FILE *fp = fopen(filename, "wb");
    if (!fp)
    {
        printf("打开写入文件出错！\n");
        exit(0);
    }
    //读取头部文件，二进制方式写入filename文件
    FILE *fh = fopen("head.txt", "rb");
    fseek(fh, 0, SEEK_END);
    long fsize = ftell(fh);
    rewind(fh);
    unsigned char *dataArray;
    dataArray = (unsigned char *)malloc(sizeof(unsigned char) * fsize);
    if (!dataArray)
    {
        printf("文件太大，内存不够，读入错误! %d\n", fsize);
        exit(0);
    }
    fread(dataArray, sizeof(unsigned char), fsize, fh);  //读取文件
    fwrite(dataArray, sizeof(unsigned char), fsize, fp); //写入文件
    free(dataArray);
    fclose(fh);

    //将树的信息写入filename文件
    fprintf(fp, "\n\nvar links = \n[\n");
    writeGraph(g, fp);
    fprintf(fp, "\n];");

    //读取尾部文件，二进制方式写入filename文件
    fh = fopen("tail1.txt", "rb");
    fseek(fh, 0, SEEK_END);
    fsize = ftell(fh);
    rewind(fh);
    dataArray = (unsigned char *)malloc(sizeof(unsigned char) * fsize);
    if (!dataArray)
    {
        printf("文件太大，内存不够，读入错误! %d\n", fsize);
        exit(0);
    }
    fread(dataArray, sizeof(unsigned char), fsize, fh);  //读取文件
    fwrite(dataArray, sizeof(unsigned char), fsize, fp); //写入文件
    free(dataArray);
    fclose(fh);

    fclose(fp);
}

int ComplementGraph(ALGraph *g)
{
    ALGraph *com = (ALGraph *)malloc(sizeof(ALGraph));
    for (int i = 0; i < g->vexnum; i++)
    {
        com->vexs[i].vex = g->vexs[i].vex;
        com->vexs[i].firstarc = NULL;
    }
    com->vexnum = g->vexnum;
    for (int i = 0; i < g->vexnum; i++)
    {
        ArcNode *p = g->vexs[i].firstarc;
        while (p)
        {
            g->vexs[p->adjvex].w = -1;
            p = p->nextarc;
        }
        for (int j = i + 1; j < g->vexnum; j++)
        {
            if (g->vexs[j].w != -1)
                AddArc(com, g->vexs[i].vex, g->vexs[j].vex, 0);
            else
                g->vexs[j].w = 0;
        }
    }
    saveGraph(com, "complement.html");
}

int visit[MAX_VERTEX_NUM];
int queue[MAX_VERTEX_NUM];
int NUM = 0;

void BFStraverse(ALGraph *g)
{
    for (int i = 0; i < g->vexnum; i++)
    {
        visit[i] = 0;
        queue[i] = -1;
    }
    for (int i = 0; i < g->vexnum; i++)
    {
        if (!visit[i])
        {
            visit[i] = 1;
            cout << g->vexs[i].vex << "-->";
            queue[NUM] = i;
            NUM++;
            while (NUM)
            {
                int pos = queue[NUM - 1];
                NUM--;
                queue[NUM] = -1;
                ArcNode *q = g->vexs[pos].firstarc;
                while (q)
                {
                    if (!visit[q->adjvex])
                    {
                        visit[q->adjvex] = 1;
                        cout << g->vexs[q->adjvex].vex << "-->";
                        queue[NUM++] = q->adjvex;
                    }
                    q = q->nextarc;
                }
            }
        }
    }
}
void DFStraverse(ALGraph *g)
{
    for (int i = 0; i < g->vexnum; i++)
    {
        visit[i] = 0;
        queue[i] = -1;
    }
    for (int i = 0; i < g->vexnum; i++)
    {
        if (!visit[i])
        {
            visit[i] = 1;
            cout << g->vexs[i].vex << "-->";
            queue[NUM] = i;
            NUM++;
            while (NUM)
            {
                int pos = queue[NUM - 1];
                NUM--;
                queue[NUM] = -1;
                if (!visit[pos])
                {
                    cout << g->vexs[pos].vex << "-->";
                    visit[pos] = 1;
                }
                ArcNode *q = g->vexs[pos].firstarc;
                while (q)
                {
                    if (!visit[q->adjvex])
                    {
                        queue[NUM++] = q->adjvex;
                    }
                    q = q->nextarc;
                }
            }
        }
    }
}

int way[MAX_VERTEX_NUM];

int not_in_queue(int pos)
{
    for (int i = 0; i < NUM; i++)
    {
        if (pos == queue[i])
            return 0;
    }
    return 1;
}
void Dijkstra(ALGraph *g, int pos)
{
    int min = 1000;
    int MIN = 1000;
    int MIN_pos;
    int min_pos;
    for (int i = 0; i < g->vexnum; i++)
    {
        queue[i] = -1;
        way[i] = INFINITY;
    }
    NUM = 0;
    queue[NUM] = pos;
    NUM++;
    ArcNode *p = g->vexs[pos].firstarc;
    while (p)
    {
        if (p->w < min)
        {
            min = p->w;
            min_pos = p->adjvex;
        }
        way[p->adjvex] = p->w;
        p = p->nextarc;
    }
    while (NUM < g->vexnum)
    {
        queue[NUM] = min_pos;
        NUM++;
        for (int i = 0; i < g->vexnum; i++)
        {
            if (not_in_queue(i))
            {
                ArcNode *q = g->vexs[min_pos].firstarc;
                while (q)
                {
                    if (q->adjvex == i)
                    {
                        if (way[i] > (q->w + min))
                        {
                            way[i] = q->w + min;
                        }
                    }
                    q = q->nextarc;
                }
                if (MIN > way[i])
                {
                    MIN = way[i];
                    MIN_pos = i;
                }
            }
        }
        min = MIN;
        min_pos = MIN_pos;
        MIN = 1000;
    }
    for (int i = 0; i < NUM; i++)
    {
        cout << i << "-->" << way[i] << endl;
    }
}

void CountTraverse(ALGraph *g)
{
    int count = 0;
    int flag = 0;
    for (int i = 0; i < g->vexnum; i++)
    {
        visit[i] = 0;
        queue[i] = -1;
    }
    for (int i = 0; i < g->vexnum; i++)
    {
        if (!visit[i])
        {
            visit[i] = 1;
            queue[NUM] = i;
            NUM++;
            while (NUM)
            {
                int pos = queue[NUM - 1];
                NUM--;
                queue[NUM] = -1;
                ArcNode *q = g->vexs[pos].firstarc;
                while (q)
                {
                    if (!visit[q->adjvex])
                    {
                        visit[q->adjvex] = 1;
                        queue[NUM++] = q->adjvex;
                    }
                    else
                    {
                        flag = 1;
                    }
                    q = q->nextarc;
                }
            }
            if (!flag)
                count++;
            flag = 0;
            cout << "now is " << i << "&" << count << endl;
        }
    }
    cout << "count" << count << endl;
}
int main()
{
    ALGraph *g = (ALGraph *)malloc(sizeof(ALGraph));
    randGenGraph(10, 0.05, "g2.txt", 300);
    initGraph(g, "g2.txt");
    for (int i = 0; i < g->vexnum; i++)
        print(g, i);
    saveGraph(g, "old.html");
    cout << "Bfs" << endl;
    CountTraverse(g);
    BFStraverse(g);
    DFStraverse(g);
    Dijkstra(g, 7);
    Merge(g, 2, 7);
    saveGraph(g, "new.html");
    ComplementGraph(g);
}
