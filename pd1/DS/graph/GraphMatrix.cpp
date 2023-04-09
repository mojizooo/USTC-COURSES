#include <iostream>
using namespace std;
#include <string.h>

#define INFINITY INT_MAX
#define MAX_VERTEX_NUM 20
typedef struct ArcCell
{
    int w;
    char *info;
} ArcCell, AdjMatrix[MAX_VERTEX_NUM][MAX_VERTEX_NUM];

typedef struct
{
    AdjMatrix adj;
    int vexnum, arcnum;
    char vexs[MAX_VERTEX_NUM];
} MGraph;

int LocateVex(char x, MGraph g)
{
    for (int i = 0; i < g.vexnum; i++)
    {
        if (x == g.vexs[i])
            return i;
    }
    return -1;
}

int CreateGraph(MGraph &G)
{
    cin >> G.vexnum >> G.arcnum;
    for (int i = 0; i < G.vexnum; i++)
    {
        cin >> G.vexs[i];
    }

    for (int i = 0; i < G.vexnum; i++)
    {
        for (int j = 0; j < G.vexnum; j++)
        {
            if (i == j)
                G.adj[i][j].w = 0;
            else
                G.adj[i][j].w = -1;
        }
    }

    for (int k = 0; k < G.arcnum; k++)
    {
        char a, b;
        int w;
        cin >> a >> b >> w;
        int i = LocateVex(b, G);
        int j = LocateVex(b, G);
        G.adj[i][j].w = w;
        G.adj[j][i] = G.adj[i][j];
    }

    return 1;
}

int AddVertex(MGraph &g, char x)
{
    if ((g.vexnum + 1) == MAX_VERTEX_NUM)
        return -1;
    if (LocateVex(x, g) != -1)
        return -1;
    g.vexs[g.vexnum++] = x;
    int k = g.vexnum - 1;
    for (int j = 0; j < g.vexnum; j++)
    {
        g.adj[j][k].w = g.adj[k][j].w = -1;
    }
    return 1;
}

int AddArc(MGraph &g)
{
    int w;
    char a, b;
    cin >> a >> b >> w;
    int i = LocateVex(a, g);
    int j = LocateVex(b, g);
    g.adj[i][j].w = g.adj[j][i].w = w;
    return 1;
}

int main()
{
    MGraph g;
}