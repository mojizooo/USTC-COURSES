#ifndef GRID_OF_SUDOKU_H
#define GRID_OF_SUDOKU_H

#include <QtWidgets>
#include <vector>
#include <memory>
#include "room_of_sudoku.h"

class SudokuGrid : public QLabel
{
    Q_OBJECT

public:
    explicit SudokuGrid(int cell_size, int fixed_size, QWidget *parent = 0);
    ~SudokuGrid();

    int get_value(int row,int col) const {return sudoku->get(row,col);}
    void status_reset(int x,int y,int v);
    void thread_set(Sudoku);
    Sudoku initial_sudoku;

public slots:

    void light_value();
    void free_selection();
    void game_start();
    void game_reset();
    void game_clear();
    void game_solve();
    void game_solve_plus();
    void game_solve_GBFS();
    void game_hint();

    void cell_selected(SudokuRoom*);
    void move_focus(int);

private:

    int cell_size, cell_span, fixed_size;
    QGridLayout *top_layer;
    SudokuRoom *current_selected;
    std::vector<SudokuRoom*> cells;
    std::shared_ptr<Sudoku> sudoku;
};
#endif // GRID_OF_SUDOKU_H
