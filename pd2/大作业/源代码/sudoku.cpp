#include <algorithm>
#include <cstdlib>
#include <map>
#include "sudoku.h"
#include <qdebug.h>

Sudoku::Sudoku(int size)
    : size_(size), span_(size * size), grids_(span_ * span_, 0)
{
}

bool Sudoku::is_empty() const
{
    return count(grids_.begin(),grids_.end(),0) == span_ * span_;
}

bool Sudoku::set(int x, int y, int v)
{
    grids_[x*span_+y]=v;
    return true;
}

bool Sudoku::reset(int x, int y)
{
    return set(x,y,0);
}

bool Sudoku::is_consistent(int x,int y,int v) const
{
    for(int k=0;k<span_;k++)
        if(v==grids_[k*span_+y])
            return false;

    for(int k=0;k<span_;k++)
        if(v==grids_[x*span_+k])
            return false;

    int row_begin = x / 3;
        row_begin *= 3;
    int col_begin = y / 3;
        col_begin *= 3;
    int col_end = col_begin + 2;
    int j = col_begin, i = row_begin;
    for (int k = 1; k <= 8; k++)
    {
        if (y != j || x != i)
        {
            if (v == grids_[i*span_+j])
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
    if (x == y)
    {
        for (int k = 0; k < x; k++)
        {
            if (v == grids_[k*span_+k])
               return false;
        }
        if (y == 4)
        {
            for (int k = 0; k < x; k++)
            {
                if (v == grids_[k*span_ + 8 - k])
                    return false;
            }
        }
    }
    else if (y == 8 - x)
    {
        for (int k = 0; k < x; k++)
        {
            if (v == grids_[k*span_+8 - k])
                return false;
        }
    }
    return true;

}

void Sudoku::random_sudoku()
{
    fill(grids_.begin(),grids_.end(),0);
    srand((unsigned)time(NULL));
    int size = 10;
    int row = 0,col = 0;
    for(;row!=9;++row){
        for(;col!=9;++col){
            int index = rand() % size-1;
            if(!is_consistent(row,col,index + 1))
                grids_[row * span_ + col] = 0;
            else grids_[row * span_ + col] = index + 1;
        }
        col=0;
    }
}

Sudoku Sudoku:: generate(int size)
{
    Sudoku new_sudoku(size);
    new_sudoku.random_sudoku();
    return new_sudoku;
}

int Sudoku::span() const
{
    return span_;
}

void Sudoku::clear()
{
     fill(grids_.begin(),grids_.end(),0);
}

int Sudoku::get(int x,int y) const
{
    return grids_[x*span_+y];
}

bool Sudoku::is_right(int row, int col, int x)
{
        if(x < 0) return false;
        for (int k = 0; k < 9; k++)
        {
            if (x == grids_[k*span_+col])
                return false;
        }
        for (int k = 0; k < 9; k++)
        {
            if (x == grids_[row*span_+k])
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
                    if (grids_[i*span_+j] == x)
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
                if (x == grids_[k*span_+k])
                    return false;
            }
            if (col == 4)
            {
                for (int k = 0; k < 9; k++)
                {
                    if (x == grids_[k*span_+8 - k])
                        return false;
                }
            }
        }
        else if (col == 8 - row)
        {
            for (int k = 0; k < 9; k++)
            {
                if (x == grids_[k*span_+8 - k])
                    return false;
            }
        }
        return true;
}

bool Sudoku::solve(int maxdep)
{
    for (int i = 0; i <= 8; i++)
    {
        for (int j = 0; j <= 8; j++)
        {
            if (grids_[i*span_+j])
            {
                continue;
            }
            if(i*span_+j > maxdep)
                return false;
            for (int k = 1; k <= 9; k++)
            {
                if (this->is_right(i, j, k))
                {
                    this->set(i,j,k);
                    if (this->solve(maxdep))
                        return true;
                    this->set(i,j,0);
                }
            }
            return false;
        }
    }
    return true;
}
void Sudoku::solve_iddfs()
{
    int dep=1;
    while(!solve(dep)){
        dep++;
    }
}

void Sudoku::update_GBFS()
{
    avail.clear();
    int sum = 0;
    for(int i = 0;i < span_;i++){
        for(int j = 0;j < span_;j++){
            if(grids_[i*span_+j]&&!candidates[i*span_+j][0]){
                    continue;
            }
            else{
                sum=0;
                for(int k=1;k<=span_;k++){
                    if(candidates[i*span_+j][k]<0) continue;
                    if(is_right(i,j,k)){
                        candidates[i*span_+j][k]=1;
                        candidates[i*span_+j][0]=1;
                        sum++;
                    }
                    else
                        candidates[i*span_+j][k]=0;
                }
                if(grids_[i*span_+j]&&candidates[i*span_+j][0]) candidates[i*span_+j][grids_[i*span_+j]]=0;
                avail.push_back(sum*100+i*span_+j);
                sort(avail.begin(),avail.end());
            }
        }
    }
    //for(int i=0;i<=80;i++) qDebug()<<avail[i]<<' ';
    //qDebug()<<'\n';
}

bool Sudoku::solve_GBFS()
{
    update_GBFS();
    int m = avail[0];
    int i = 0;
    int j = 0;
    int k;
    while(m>=0){
        for(i = 0,m = avail[0];grids_[m%100/span_*span_ + m%100%9]&&i<=80;i++) m = avail[i];
        if(i==81) return true;

        for(k=1;k<=9;k++){
            if(candidates[m%100][k]>0){
                queue.push_back(m);
                this->set(m%100/9, m%100%9, k);
                qDebug()<<m%100/9<<m%100%9<<k;
                break;
            }
        }
            if(k==10){
                qDebug()<<m;
                for(int i=1;i<=9;i++) candidates[m%100][i] = 0;
                int m_ = queue.back();
                queue.pop_back();
                qDebug()<<m_;
                int n = grids_[m_%100/span_*span_ + m_%100%9];
                this->reset(m_%100/9, m_%100%9);
                candidates[m_%100][n] = -1;
                update_GBFS();
                continue;
            }
            update_GBFS();
            j++;
        }
        return false;
}

void Sudoku::clear_GBFS()
{
    memset(candidates,0,sizeof (candidates));
    avail.clear();
    queue.clear();
}
