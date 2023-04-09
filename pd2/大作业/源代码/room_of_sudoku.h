#ifndef ROOM_OF_SUDOKU_H
#define ROOM_OF_SUDOKU_H

#include <QtWidgets>
#include <memory>
#include "sudoku.h"
#include "font.h"

class SudokuRoom : public QLabel
{
    Q_OBJECT
public:
    explicit SudokuRoom(int row, int col, std::shared_ptr<Sudoku> sudoku, QWidget *parent = 0);

    void set_value(int v);
    void set_initial_status(int v);
    bool is_initial_status() const;
    void emit_selected_signal();
    void remove_value();
    bool check_value(int v);
    void light_value(int);

    int get_row() const { return row; }
    int get_col() const { return col; }
    int get_value() const {return sudoku->get(row,col);}

signals:

    void selected_signal(SudokuRoom*);
    void move_focus(int);

public slots:

    void free_selection();
    void selected();

protected:
    void mousePressEvent(QMouseEvent*);
    void keyPressEvent(QKeyEvent*);
    void paintEvent(QPaintEvent*);

private:
    void update_text(int);
    void update_font();
    void update_style();

private:
    int row, col, initial_status;
    std::shared_ptr<Sudoku> sudoku;

    bool is_lighted;
    bool is_selected;

};

#endif // ROOM_OF_SUDOKU_H
