#ifndef THREAD_H
#define THREAD_H

#include "sudoku.h"
#include "QThread"

class SudokuThread : public QThread
{
    Q_OBJECT

private:
    bool stop_ = false;
    bool paused_ = true;

protected:
    void run() Q_DECL_OVERRIDE;

public:
    SudokuThread();
    Sudoku* sudoku;
    void solve_();

signals:
    void newSolution(Sudoku sd);
};

#endif // THREAD_H
