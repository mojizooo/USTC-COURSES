#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <vector>
#include <fstream>
#include <cstring>
using namespace std;
void print(int num[][9])
{
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            cout << num[i][j] << ' ';
        }
        cout << endl;
    }
}
bool check(int num[][9], int row, int col)
{
    int n = num[row][col];
    if (!n)
        return true;
    for (int k = 0; k < row; k++)
    {
        if (n == num[k][col])
            return false;
    }
    for (int k = 0; k < col; k++)
    {
        if (n == num[row][k])
            return false;
    }
    int row_begin = row / 3;
    row_begin *= 3;
    int col_begin = col / 3;
    col_begin *= 3;
    int col_end = col_begin + 2;
    int row_end = row_begin + 2;
    int j = col_begin, i = row_begin;
    for (int k = 1; k <= 8; k++)
    {
        if (col != j || row != i)
        {
            if (n == num[i][j])
                return false;
        }
        else
            break;
        if (j == col_end)
        {
            j = col_begin;
            i += 1;
        }
        else
            j += 1;
    }
    if (col == row)
    {
        for (int k = 0; k < row; k++)
        {
            if (n == num[k][k])
                return false;
        }
        if (col == 4)
        {
            for (int k = 0; k < row; k++)
            {
                if (n == num[k][8 - k])
                    return false;
            }
        }
    }
    else if (col == 8 - row)
    {
        for (int k = 0; k < row; k++)
        {
            if (n == num[k][8 - k])
                return false;
        }
    }
    return true;
}
bool sudoku(int num[][9], int row, int col)
{

    int k = 1;
    int size = 10;
    int count = 0;
    int a[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    while (row < 9 && count < 17)
    {

        int index = rand() % size;
        int number = a[index];
        num[row][col] = number;
        if (!check(num, row, col))
        {
            num[row][col] = 0;
        }
        if (num[row][col])
            count++;
        if (col == 8)
        {
            for (int i = 0; i < 10; i++)
            {
                a[i] = i;
            }
            size = 10;
            col = 0;
            row += 1;
            continue;
        }
        else
        {
            col += 1;
            continue;
        }
        cout << count << endl;
    }
    return true;
}
bool isright(int num[][9], int row, int col, int x)
{
    for (int k = 0; k < 9; k++)
    {
        if (x == num[k][col])
            return false;
    }
    for (int k = 0; k < 9; k++)
    {
        if (x == num[row][k])
            return false;
    }
    int startRow = (row / 3) * 3;
    int startCol = (col / 3) * 3;
    for (int i = startRow; i < startRow + 3; i++)
    {
        for (int j = startCol; j < startCol + 3; j++)
        {
            if (i != row && j != col)
            {
                if (num[i][j] == x)
                {
                    return false;
                }
            }
        }
    }
    if (col == row)
    {
        for (int k = 0; k < 9; k++)
        {
            if (x == num[k][k])
                return false;
        }
        if (col == 4)
        {
            for (int k = 0; k < 9; k++)
            {
                if (x == num[k][8 - k])
                    return false;
            }
        }
    }
    else if (col == 8 - row)
    {
        for (int k = 0; k < 9; k++)
        {
            if (x == num[k][8 - k])
                return false;
        }
    }
    return true;
}
bool isrightposition(int num[][9], int row, int col, int x)
{
    for (int k = 0; k < 9; k++)
    {
        if (x == num[k][col])
        {
            cout << "ERROR illegal , the line " << k + 1 << " column " << col + 1 << " has the same number" << endl;
            return false;
        }
    }
    for (int k = 0; k < 9; k++)
    {
        if (x == num[row][k])
        {
            cout << "ERROR illegal , the line " << row + 1 << " column " << k + 1 << " has the same number" << endl;
            return false;
        }
    }
    int startRow = (row / 3) * 3;
    int startCol = (col / 3) * 3;
    for (int i = startRow; i < startRow + 3; i++)
    {
        for (int j = startCol; j < startCol + 3; j++)
        {
            if (i != row && j != col)
            {
                if (num[i][j] == x)
                {
                    cout << "ERROR illegal , the line " << i + 1 << " column " << j + 1 << " has the same number" << endl;
                    return false;
                }
            }
        }
    }
    if (col == row)
    {
        for (int k = 0; k < 9; k++)
        {
            if (x == num[k][k])
            {
                cout << "ERROR illegal , the line " << k + 1 << " column " << k + 1 << " has the same number" << endl;
                return false;
            }
        }
        if (col == 4)
        {
            for (int k = 0; k < 9; k++)
            {
                if (x == num[k][8 - k])
                {
                    cout << "ERROR illegal , the line " << k + 1 << " column " << col + 1 << " has the same number" << endl;
                    return false;
                }
            }
        }
    }
    else if (col == 8 - row)
    {
        for (int k = 0; k < 9; k++)
        {
            if (x == num[k][8 - k])
            {
                cout << "ERROR illegal , the line " << k + 1 << " column " << col + 1 << " has the same number" << endl;
                return false;
            }
        }
    }
    return true;
}
bool solve(int num[][9])
{
    for (int i = 0; i <= 8; i++)
    {
        for (int j = 0; j <= 8; j++)
        {
            if (num[i][j])
            {
                continue;
            }
            for (int k = 1; k <= 9; k++)
            {
                if (isright(num, i, j, k))
                {
                    num[i][j] = k;
                    if (solve(num))
                        return true;
                    num[i][j] = 0;
                }
            }
            return false;
        }
    }
    return true;
}

bool dfs(int num[][9], int depth)
{
    int candidate[81][9];
    for (int i = 0; i <= 8; i++)
    {
        for (int j = 0; j <= 8; j++)
        {
            for (int k = 0; k <= 9; k++)
            {
                if (isright(num, i, j, k))
                {
                }
            }
        }
    }
}

bool input(int num[][9])
{
    int count = 0;
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            cin >> num[i][j];
            if (!check(num, i, j))
            {
                cout << "illegal input" << endl;
                return false;
            }
            if (!num[i][j])
                count++;
        }
    }
    if (count < 17)
    {
        cout << "illegal input" << endl;
        return false;
    }
    return true;
}

bool Put(int num[][9], int row, int col, int x)
{
    int Row = row - 1, Col = col - 1;
    if (x > 9)
    {
        cout << "ERROR data range exceed" << endl;
        return false;
    }

    if (row > 9 || col > 9)
    {
        cout << "ERROR illegal location" << endl;
        return false;
    }

    if (num[Row][Col])
    {
        cout << "ERROR there is already a number in this position" << endl;
        return false;
    }

    if (!isrightposition(num, Row, Col, x))
    {
        return false;
    }
    num[Row][Col] = x;
    return true;
}
bool hint(int num[][9], int Num[][9])
{
    int record[82];
    int k = 0;
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            if (num[i][j])
                continue;
            record[k++] = 9 * i + j + 1;
        }
    }
    if (!k)
        return false;
    int zero = rand() % k;
    int pos = record[zero];
    cout << pos << endl;
    num[(pos - 1) / 9][(pos - 1) % 9] = Num[(pos - 1) / 9][(pos - 1) % 9];
    return true;
}
int main()
{
    int num[9][9];
    int Num[9][9];
    int record[82];
    char game[10];
    int k = 0;
    time_t now_time = time(NULL);
    tm *t_tm = localtime(&now_time);
    struct tm *p;
    while (1)
    {
        char ab;
        scanf("%c", &ab);
        ofstream outfile;
        ifstream infile;
        char data[20] = "yes";
        char _data[20];
        char s[20];
        int flag = 0;
        int flag1 = 0;
        int count = 1;
        switch (ab)
        {
        case 'a':
            int row, col, x;
            cin >> row >> col >> x;
            if (Put(num, row, col, x))
            {
                print(num);
            }
            break;
        case 'b':
        receive:
            infile.open("record.txt");
            k = 0;
            memset(_data, 0, sizeof(_data));
            cout << "input your game record name" << endl;
            cin >> s;
            while (strcmp(data, _data))
            {
                strcpy(_data, data);
                infile >> data;
                if (!strcmp(data, s))
                {
                    flag1 = 1;
                }
                k++;
            }
            if (flag1)
            {
                cout << "this name has been used, please try again" << endl;
                flag1 = 0;
                infile.close();
                goto receive;
            }
            outfile.open("record.txt", ios::app);
            time_t nowtime;
            time(&nowtime);
            p = localtime(&nowtime);

            outfile << k / 3 + 1 << endl;
            outfile << s << endl;
            outfile << p->tm_year + 1900 << '.' << p->tm_mon << '.' << p->tm_mday << '.' << p->tm_hour << '.' << p->tm_min << '.' << p->tm_sec << endl;
            outfile.close();
            memset(game, 0, sizeof(game));
            itoa(k / 3 + 1, game, 10);
            cout << game[0] << endl;
            strcat(game, ".txt");
            outfile.open(game);
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    outfile << num[i][j] << ' ';
                }
                outfile << endl;
            }
            outfile.close();
            cout << "your game state has been recorded successfully" << endl;
            break;
        case 'c':
            if (input(num))
            {
                cout << "accept your input" << endl;
                print(num);
            }
            break;
        case 'd':
        generate:
            srand((unsigned)time(NULL));
            memset(num, 0, sizeof(num));
            if (sudoku(num, 0, 0))
            {
                cout << "generated sudoku is" << endl;
                print(num);
            }
            break;
        case 'e':
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    if (Num[i][j] == num[i][j])
                        continue;
                    Num[i][j] = num[i][j];
                }
            }
            if (solve(Num))
            {
                cout << "the solution is" << endl;
                print(Num);
                flag = 1;
            }
            else
                cout << "this sudoku can't be solved" << endl;
            break;
        case 'f':
            if (flag)
            {
                srand((unsigned)time(NULL));
                cout << "before sudoku is" << endl;
                print(num);
                cout << "now it is" << endl;
                hint(num, Num);
                print(num);
            }
            else
            {
                for (int i = 0; i < 9; i++)
                {
                    for (int j = 0; j < 9; j++)
                    {
                        if (Num[i][j] == num[i][j])
                            continue;
                        Num[i][j] = num[i][j];
                    }
                }
                if (solve(Num))
                {
                    flag = 1;
                    srand((unsigned)time(NULL));
                    cout << "before sudoku is" << endl;
                    print(num);
                    cout << "now it is" << endl;
                    hint(num, Num);
                    print(num);
                }
                else
                    cout << "this sudoku can't be solved" << endl;
            }
            break;
        case 'g':
            cout << "0-newgame" << endl;
            infile.open("record.txt");
            while (1)
            {
                infile >> data;
                if (infile.peek() == EOF)
                    break;
                if (!(count % 3))
                {
                    cout << data << endl;
                }
                else
                {
                    cout << data << '-';
                }
                count++;
            }
            cout << "press the record code to load game" << endl;
            infile.close();
            int such;
            cin >> such;
            if (!such)
                goto generate;
            itoa(such, game, 10);
            strcat(game, ".txt");
            infile.open(game);
            cout << "last time suduko is" << endl;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    infile >> num[i][j];
                    cout << num[i][j] << ' ';
                }
                cout << endl;
            }
            infile.close();
            break;
        case 'h':
            return 0;
        }
    }
}
/*
0 0 0 0 8 0 2 0 0   
6 0 7 0 0 0 0 0 0
0 0 0 7 5 2 0 0 0
0 0 0 0 0 0 0 0 0
0 0 6 0 0 0 9 0 4
5 0 3 0 0 0 0 0 0
0 1 0 5 0 0 0 7 0
0 0 0 0 0 1 0 0 9
0 9 2 0 0 0 0 0 0*/