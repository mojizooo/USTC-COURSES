#include "thread.h"
#include <QTime>

SudokuThread::SudokuThread()
{
}

void SudokuThread::run()
{
    stop_ = true;
    while(!stop_)
    {
        this->solve_();
        emit newSolution(*sudoku);
        msleep(500);
        stop_ = true;
    }
    quit();
}

void SudokuThread::solve_()
{
    sudoku->clear_GBFS();
    sudoku->solve_GBFS();
}
