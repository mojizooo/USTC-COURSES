#include <algorithm>
#include <grid_of_sudoku.h>
#include <QtWidgets>

SudokuGrid::SudokuGrid(int cell_size, int fixed_size, QWidget *parent)
    : QLabel(parent),
      cell_size(cell_size),
      cell_span(cell_size * cell_size),
      fixed_size(fixed_size),
      current_selected(nullptr),
      sudoku(std::make_shared<Sudoku>(cell_size))
{
    top_layer = new QGridLayout(this);

    cells.assign(cell_span * cell_span, nullptr);
    for(int r = 0; r != cell_size; ++r)
        for(int c = 0; c != cell_size; ++c)
        {
            QGridLayout *grid = new QGridLayout;
            top_layer->addLayout(grid, r, c);
            grid->setSpacing(1);

            for(int x = 0; x != cell_size; ++x)
                for(int y = 0; y != cell_size; ++y)
                {
                    int row = r * cell_size + x;
                    int col = c * cell_size + y;
                    SudokuRoom *cell = new SudokuRoom(row, col, sudoku);
                    cell->setFocusPolicy(Qt::ClickFocus);
                    cell->setFixedSize(fixed_size, fixed_size);
                    cell->setTextFormat(Qt::PlainText);
                    cell->setAlignment(Qt::AlignCenter);

                    grid->addWidget(cell, x, y);

                    cells[row * cell_span + col] = cell;
                }
        }

    for(int r = 0; r != cell_span; ++r)
        for(int c = 0; c != cell_span; ++c)
        {
            SudokuRoom *cell = cells[r * cell_span + c];

            connect(cell, SIGNAL(selected_signal(SudokuRoom*)),
                    this, SLOT(cell_selected(SudokuRoom*)));

            connect(cell, SIGNAL(selected_signal(SudokuRoom*)),
                    this, SLOT(light_value()));

            connect(cell, SIGNAL(move_focus(int)),
                    this, SLOT(move_focus(int)));

            connect(cell, SIGNAL(selected_signal(SudokuRoom*)),
                    cell, SLOT(selected()));
        }

    top_layer->setSpacing(2);
    top_layer->setContentsMargins(4,4,4,4);
    setStyleSheet(QString("background-color: ") + "#000000"+ ";");

    int size = (fixed_size + 1) * cell_span + cell_size * 2;
    setFixedSize(size+10, size+10);
}

SudokuGrid::~SudokuGrid()
{
}

void SudokuGrid::cell_selected(SudokuRoom *cell)
{
    if(cell!=current_selected)
    {
        free_selection();
        current_selected = cell;
        cell->setFocus();
    }
}

void SudokuGrid::move_focus(int key)
{
    int row = current_selected->get_row();
    int col = current_selected->get_col();
    int dr = 0, dc = 0;

    if(key == Qt::Key_Left) dc = -1;
    else if(key == Qt::Key_Right) dc = 1;
    else if(key == Qt::Key_Up) dr = -1;
    else if(key == Qt::Key_Down) dr = 1;

    row += dr, col += dc;

    if(0 <= row && row < cell_span && 0 <= col && col < cell_span)
    {
        int id = row * cell_span + col;
        cells[id]->emit_selected_signal();
    }
}

void SudokuGrid::free_selection()
{
    if(current_selected){
        current_selected->free_selection();

        for(SudokuRoom* cell : cells)
            cell->light_value(0);
    }
    current_selected = nullptr;

}

void SudokuGrid::game_start()
{
    *sudoku = Sudoku::generate(cell_size);
    initial_sudoku = *sudoku;
    game_reset();
}

void SudokuGrid::game_reset()
{
    free_selection();
    *sudoku = initial_sudoku;
    for(int r = 0; r != cell_span; ++r)
        for(int c = 0; c != cell_span; ++c)
        {
            int id = r * cell_span + c;
            cells[id]->set_initial_status(initial_sudoku.get(r, c));
        }
}

void SudokuGrid::status_reset(int x,int y, int v)
{
    if(!v)
        cells[x*cell_span+y]->set_initial_status(this->get_value(x,y));
    else
        cells[x*cell_span+y]->set_initial_status(v);
}
void SudokuGrid::game_clear()
{
    sudoku->clear();
    initial_sudoku = *sudoku;
    game_reset();
}

void SudokuGrid::light_value()
{
    if(current_selected)
    {
        int value = current_selected->get_value();
        for(SudokuRoom * cell : cells)
            cell->light_value(value);
    }
}

void SudokuGrid::game_solve()
{
    if(sudoku->solve(80)){
        for(int r = 0; r != cell_span; ++r)
            for(int c = 0; c != cell_span; ++c)
                    cells[r * cell_span + c]->set_value(sudoku->get(r,c));
    }
    else
        QMessageBox::warning(parentWidget(),"Error","can't be solved");

}

void SudokuGrid::game_solve_plus()
{
    sudoku->solve_iddfs();
    for(int r = 0; r != cell_span; ++r)
        for(int c = 0; c != cell_span; ++c)
                cells[r * cell_span + c]->set_value(sudoku->get(r,c));
}

void SudokuGrid::game_solve_GBFS()
{
    sudoku->clear_GBFS();
    if(sudoku->solve_GBFS()){
        for(int r = 0; r != cell_span; ++r)
            for(int c = 0; c != cell_span; ++c)
                    cells[r * cell_span + c]->set_value(sudoku->get(r,c));
    }
    else
        QMessageBox::warning(parentWidget(),"Error","can't be solved");
}

void SudokuGrid::game_hint()
{
    Sudoku ans = *sudoku;
    if(ans.solve(81)){
    int hint[82];
    int k = 0;
        for (int i = 0; i < 9; i++)
        {
            for (int j = 0; j < 9; j++)
            {
                if (sudoku->get(i,j))
                    continue;
                hint[k++] = 9 * i + j;
            }
        }
        if (!k){
            QMessageBox::warning(parentWidget(),"warning","already solved");
            return ;
        }
        int zero = rand() % k;
        int pos = hint[zero];
        cells[pos]->emit_selected_signal();
        cells[pos]->set_value(ans.get(pos/9,pos%9));
    }
    else QMessageBox::warning(parentWidget(),"warning","can't be solved");
}

void SudokuGrid::thread_set(Sudoku sd)
{
    for(int r = 0; r != cell_span; ++r)
        for(int c = 0; c != cell_span; ++c)
                cells[r * cell_span + c]->set_value(sd.get(r,c));
}
