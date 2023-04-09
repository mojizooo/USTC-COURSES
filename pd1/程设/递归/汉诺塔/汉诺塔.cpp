#include <iostream>
using namespace std;
//将 n 个盘子从 a 柱移动到b柱，用c柱做中转
void Hanoi(int n, char a, char b, char c)
{
    if (n == 1)
    {
        cout << '1' << a << "->" << b << endl;
        return;
    }
    //先将n-1个盘子，以b为中转，从a柱移动到c柱，
    Hanoi(n - 1, a, c, b);
    //将一个盘子从a移动到b
    cout << n << a << "->" << b << endl;
    //将c柱上的n-1个盘子，以a为中转，移动到b柱
    Hanoi(n - 1, c, b, a);
}
int main()
{
    int N;
    cout << "Please input disc number: " << endl;
    cin >> N;
    cout << "The solution is:" << endl;
    Hanoi(N, 'A', 'B', 'C');
}
