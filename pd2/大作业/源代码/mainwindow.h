#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <vector>
#include <QtWidgets>
#include <grid_of_sudoku.h>
#include <button.h>
#include <rec_button.h>
#include <thread.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public slots:
    void game_start();
    void game_clear();
    void game_exit();
    bool game_save();
    void game_solve();
    void game_solve_plus();
    void game_load();
    void game_hint();
    void game_help();
    void rec_selected(recbtn*);
    void rec_chosen(QString);
    void threadA_solve(Sudoku sd);

private:
    void init_widgets(int);
    void set_tool_enable(bool);
    SudokuThread threadA;

private:
    Ui::MainWindow *ui;
    QWidget *window;
    QVBoxLayout *layout, *rec_layout;
    QHBoxLayout *top_layout, *bottom_layout;
    SudokuGrid *grid;
    Button *start_btn, *exit_btn, *hint_btn, *clear_btn;
    Button *save_btn, *load_btn, *solve_btn;
    Button *help_btn;
    QPlainTextEdit *save_rec;
    recbtn *rec_btn;
};

QT_END_NAMESPACE

#endif // MAINWINDOW_H
