#include <algorithm>
#include <cmath>
#include "room_of_sudoku.h"
#include "font.h"

SudokuRoom::SudokuRoom(int row, int col, std::shared_ptr<Sudoku> sudoku, QWidget *parent)
    : QLabel(parent),
      row(row), col(col),
      initial_status(0),
      sudoku(sudoku),
      is_lighted(false),
      is_selected(false)
{
    update_style();
}

void SudokuRoom::update_style()
{
    QString text_color = "#000000",
            bg_color = "white",
            font_style = "normal",
            font_weight = "normal";

    if(!initial_status) text_color = "red";
    if(is_selected){
        bg_color = "#E6E6FA";
        font_style = "italic";
        font_weight = "900";
    }
    if(is_lighted)
    {
        font_style = "italic";
        font_weight = "900";
    }

    setStyleSheet("background-color: " + bg_color + ";"
                  "color: " + text_color + ";"
                  "font-style: " + font_style + ";"
                  "font-weight: " + font_weight + ";");
}

void SudokuRoom::update_text(int v)
{
    QString str;
    if(v==0) str="";
    else str += QString::number(v);
    setText(str);
    update_font();
}

void SudokuRoom::update_font()
{
    QFont font=this->font();
    font = fitted_font(font);
    setFont(font);
}

void SudokuRoom::free_selection()
{
    is_selected = false;
    update_style();
}

void SudokuRoom::set_value(int v)
{
    int span = sudoku->span();
    if(1 <= v && v <= span)
    {
        sudoku->set(row,col,v);
        update_text(v);
    }
}

void SudokuRoom::set_initial_status(int v)
{
    initial_status = v;

    if(v) set_value(v);
    else update_text(v);

    update_style();
}

void SudokuRoom::mousePressEvent(QMouseEvent *event)
{
    emit_selected_signal();
}

void SudokuRoom::keyPressEvent(QKeyEvent *event)
{
    int key = event->key();
    if(!is_initial_status()){
        if(Qt::Key_1 <= key && key <= Qt::Key_9)
        {
            int val = key - Qt::Key_0;
            if(check_value(val)){
                set_value(val);
            }
        } else if(key == Qt::Key_Backspace)
            remove_value();
    }

    if(key == Qt::Key_Left || key == Qt::Key_Right || key == Qt::Key_Down
            || key == Qt::Key_Up || key == Qt::Key_Tab)
        emit move_focus(key);
}

void SudokuRoom::remove_value()
{
    sudoku->set(row,col,0);
    update_text(0);
}

void SudokuRoom::emit_selected_signal()
{
    emit selected_signal(this);
}

bool SudokuRoom::is_initial_status() const
{
    return initial_status != 0;
}

void SudokuRoom::paintEvent(QPaintEvent *event)
{
    QLabel::paintEvent(event);
    QPainter p(this);
}

void SudokuRoom::selected()
{
    is_selected = true;
    update_style();
}

bool SudokuRoom::check_value(int v)
{
    int row = this->get_row();
    int col = this->get_col();

    if(sudoku->is_consistent(row,col,v)){
        return true;
    }
    else
        return false;

}

void SudokuRoom::light_value(int v)
{
    if(v && this->get_value() == v){
        is_lighted = true;
    }
    else
        is_lighted = false;
    update_style();
}

