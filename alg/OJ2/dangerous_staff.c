#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct edge
{
    int node1;
    int node2;
    int len;
} edge;
edge Edge[1000002];
typedef struct choice
{
    int con_now;
    int dis_con;
} choice;
choice Choice[100002];
int new_con(int new)
{
    return (Choice[new].con_now == new) ? new : new_con(Choice[new].con_now);
}
int cmp(const void *a, const void *b)
{
    return (*(edge *)b).len - (*(edge *)a).len;
}
int main()
{
    int n, m;
    int res = 0;
    scanf("%d %d", &n, &m);
    for (int i = 0; i < m; i++)
    {
        scanf("%d %d %d", &Edge[i].node1, &Edge[i].node2, &Edge[i].len);
    }
    for (int i = 0; i <= n; i++)
    {
        Choice[i].con_now = i;
        Choice[i].dis_con = 0;
    }
    qsort(Edge, m, sizeof(edge), cmp);
    int n1, n2;
    int n1_con, n2_con;
    for (int i = 0; i < m; i++)
    {
        n1 = Edge[i].node1;
        n1_con = new_con(n1);
        n2 = Edge[i].node2;
        n2_con = new_con(n2);
        if (n1_con == n2_con)
        {
            res = Edge[i].len;
            break;
        }
        else if (Choice[n1].dis_con && !Choice[n2].dis_con)
            Choice[n2_con].con_now = new_con(Choice[n1_con].dis_con);
        else if (!Choice[n1].dis_con && Choice[n2].dis_con)
            Choice[n1_con].con_now = new_con(Choice[n2_con].dis_con);
        else if (!Choice[n1].dis_con && !Choice[n2].dis_con)
        {
            Choice[n2_con].con_now = new_con(Choice[n1_con].dis_con);
            Choice[n1_con].con_now = new_con(Choice[n2_con].dis_con);
        }
        Choice[n1].dis_con = n2;
        Choice[n2].dis_con = n1;
    }
    printf("%d", res);
}