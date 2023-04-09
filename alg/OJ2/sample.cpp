#include <stdio.h>
#include <stdlib.h>
#include <algorithm>
#include <iostream>
using namespace std;

typedef struct Edge_Weight
{
    int i, j;
    int w;
} Edge_Weight;

typedef struct Dependency
{
    int acc;
    int rej;
} Dependency;

bool cmp(Edge_Weight x, Edge_Weight y)
{
    return (x.w > y.w);
}

int CHECK(Dependency A[], int acc)
{
    if (A[acc].acc == acc)
        return acc;
    else
        return CHECK(A, A[acc].acc);
}

int main(void)
{
    int i, m, n, result = 0;
    int node_i, node_j;
    int node_i_acc, node_j_acc;

    cin >> n >> m;
    Dependency *Dep = (Dependency *)malloc(sizeof(Dependency) * (n + 1));
    Edge_Weight *EW = (Edge_Weight *)malloc(sizeof(Edge_Weight) * (m + 1));

    for (i = 0; i < m; i++)
        cin >> EW[i].i >> EW[i].j >> EW[i].w;

    for (i = 0; i < n + 1; i++)
    {
        Dep[i].acc = i;
        Dep[i].rej = 0;
    }

    sort(EW, EW + m, cmp);

    for (i = 0; i < m; i++)
    {

        node_i = EW[i].i;
        node_j = EW[i].j;
        node_i_acc = CHECK(Dep, node_i);
        node_j_acc = CHECK(Dep, node_j);

        if (node_i_acc == node_j_acc)
        {
            result = EW[i].w;
            break;
        }
        if (Dep[node_i].rej > 0 && Dep[node_j].rej > 0)
        {
            Dep[node_i_acc].acc = CHECK(Dep, Dep[node_j_acc].rej);
            Dep[node_j_acc].acc = CHECK(Dep, Dep[node_i_acc].rej);
        }
        else if (Dep[node_i].rej == 0 && Dep[node_j].rej > 0)
            Dep[node_i_acc].acc = CHECK(Dep, Dep[node_j_acc].rej);

        else if (Dep[node_i].rej > 0 && Dep[node_j].rej == 0)
            Dep[node_j_acc].acc = CHECK(Dep, Dep[node_i_acc].rej);

        Dep[node_i].rej = node_j;
        Dep[node_j].rej = node_i;
    }
    cout << result << endl;
    return 0;
}