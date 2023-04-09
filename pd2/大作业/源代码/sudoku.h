#ifndef SUDOKU_H
#define SUDOKU_H

#include "font.h"
#include <vector>

class Sudoku
{
    int size_, span_;
    std::vector<int> avail;
    std::vector<int> queue;
    std::vector<int> grids_;
    int candidates[81][10];

public:
    Sudoku(int size = 3);
    ~Sudoku() = default;
    bool is_empty() const;
    bool is_solved() const;
    void clear();
    bool reset(int x, int y);
    bool set(int x, int y, int v);
    int get(int x, int y) const;
    bool is_consistent(int x,int y,int v) const;
    bool solve(int dep) ;
    void solve_iddfs();
    bool solve_GBFS();
    void update_GBFS();
    void clear_GBFS();
    int  span() const;
    bool is_right(int x,int y,int v);
    void random_sudoku();
    static Sudoku generate(int size);

};

#endif // SUDOKU_H

