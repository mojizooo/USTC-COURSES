#include <stdio.h>
#include <stdlib.h>

typedef struct AdjVNode *PtrToAdjVNode;
struct AdjVNode
{
    int adjv;
    int weight;
    PtrToAdjVNode next;
};

typedef struct VNode
{
    /* data */
    PtrToAdjVNode firstedge;
} AdjList[10001];

typedef struct GNode *LGraph;
struct GNode
{
    /* data */
    int nv;
    int ne;
    AdjList G;
};
typedef struct ENode *PtrToENode;
typedef PtrToENode Edge;
struct ENode
{
    /* data */
    int v1, v2;
    int w;
};

LGraph initgraph(int vn)
{
    LGraph G = (LGraph)malloc(sizeof(struct GNode));
    G->nv = vn;
    G->ne = 0;

    for (int i = 0; i < G->nv; i++)
    {
        G->G[i].firstedge = NULL;
    }

    return G;
}

void insertedge(LGraph g, Edge e)
{
    PtrToAdjVNode ne = (PtrToAdjVNode)malloc(sizeof(struct AdjVNode));
    ne->adjv = e->v2;
    ne->weight = e->w;
    ne->next = g->G[e->v1].firstedge;
    g->G[e->v1].firstedge = ne;

    ne = (PtrToAdjVNode)malloc(sizeof(struct AdjVNode));
    ne->adjv = e->v1;
    ne->weight = e->w;
    ne->next = g->G[e->v2].firstedge;
    g->G[e->v2].firstedge = ne;
}

LGraph buildgraph(int vn, int en)
{
    LGraph g = initgraph(vn);
    g->ne = en;

    if (en)
    {
        Edge e = (Edge)malloc(sizeof(struct ENode));
        for (int i = 0; i < en; i++)
        {
            scanf("%d %d %d", &e->v1, &e->v2, &e->w);
            
        }
    }
}
