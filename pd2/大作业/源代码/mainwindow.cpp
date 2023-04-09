#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDir>
#include <QFile>
#include <QIODevice>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    init_widgets(3);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::init_widgets(int cell_size)
{
    int fixed_size=50;

    window=new QWidget;
    setCentralWidget(window);

    layout = new QVBoxLayout(window);
    top_layout=new QHBoxLayout;
    bottom_layout=new QHBoxLayout;

    layout->addLayout(top_layout);
    layout->addLayout(bottom_layout);

    grid = new SudokuGrid(cell_size,fixed_size);
    bottom_layout->addWidget(grid);

    save_rec = new QPlainTextEdit;

    bottom_layout->setSpacing(15);


    rec_layout = new QVBoxLayout;
    rec_layout->setContentsMargins(4,4,4,4);

    rec_btn = new recbtn(0);
    recbtn *rec = rec_btn;
    rec->setFocusPolicy(Qt::ClickFocus);
    rec->setTextFormat(Qt::PlainText);
    rec->setAlignment(Qt::AlignCenter);
    connect(rec_btn, SIGNAL(selected_signal(recbtn*)), this, SLOT(rec_selected(recbtn*)));
    connect(rec_btn, SIGNAL(entered_signal(QString)), this, SLOT(rec_chosen(QString)));

    bottom_layout->addLayout(rec_layout);
    rec_layout->addWidget(save_rec);
    rec_layout->addWidget(rec_btn);

    save_rec->setFixedSize(100,400);
    rec_btn->setFixedSize(100,50);
    bottom_layout->setContentsMargins(1, 1, 1, 1);
    //setFixedSize(window->maximumSize());

    start_btn = new Button;
    start_btn->set_image("D:/icons/new.png");
    start_btn->setToolTip("New Game(random)");
    connect(start_btn, SIGNAL(clicked()), this, SLOT(game_start()));

    exit_btn = new Button;
    exit_btn->set_image("D:/icons/exit.png");
    exit_btn->setToolTip("Exit");
    connect(exit_btn, SIGNAL(clicked()), this, SLOT(game_exit()));

    hint_btn = new Button;
    hint_btn->set_image("D:/icons/hint.png");
    hint_btn->setToolTip("Hint");
    connect(hint_btn, SIGNAL(clicked()), this, SLOT(game_hint()));

    clear_btn = new Button;
    clear_btn->set_image("D:/icons/clear.png");
    clear_btn->setToolTip("Clear for a DIY Game");
    connect(clear_btn, SIGNAL(clicked()), this, SLOT(game_clear()));

    save_btn = new Button;
    save_btn->set_image("D:/icons/saver.png");
    save_btn->setToolTip("Save");
    connect(save_btn, SIGNAL(clicked()), this, SLOT(game_save()));

    load_btn = new Button;
    load_btn->set_image("D:/icons/load.png");
    load_btn->setToolTip("Load");
    connect(load_btn, SIGNAL(clicked()), this, SLOT(game_load()));

    solve_btn = new Button;
    solve_btn->set_image("D:/icons/solve.png");
    solve_btn->setToolTip("Solve");
    connect(solve_btn, SIGNAL(clicked()), this, SLOT(game_solve()));

    help_btn = new Button;
    help_btn->set_image("D:/icons/help.png");
    help_btn->setToolTip("Help");
    connect(help_btn, SIGNAL(clicked()), this, SLOT(game_help()));

    top_layout->addSpacerItem(new QSpacerItem(1, 1, QSizePolicy::Expanding, QSizePolicy::Minimum));

    top_layout->addWidget(start_btn);
    top_layout->addWidget(clear_btn);
    top_layout->addWidget(solve_btn);
    top_layout->addWidget(hint_btn);
    top_layout->addWidget(save_btn);
    top_layout->addWidget(load_btn);
    top_layout->addWidget(exit_btn);
    top_layout->addWidget(help_btn);

    top_layout->addSpacerItem(new QSpacerItem(350, 1, QSizePolicy::Expanding, QSizePolicy::Minimum));

    grid->game_start();

}

void MainWindow::game_start()
{
    set_tool_enable(true);
    grid->game_start();
}

void MainWindow::game_clear()
{
    grid->game_clear();
}

void MainWindow::set_tool_enable(bool if_enabled)
{
    start_btn->setEnabled(if_enabled);
    exit_btn->setEnabled(if_enabled);
    clear_btn->setEnabled(if_enabled);
    hint_btn->setEnabled(if_enabled);
    solve_btn->setEnabled(if_enabled);
    save_btn->setEnabled(if_enabled);
    load_btn->setEnabled(if_enabled);
}

void MainWindow::game_exit()
{
    int button;
    button = QMessageBox::question(this, tr("退出程序"),
                                   QString(tr("是否保存？")),
                                   QMessageBox::Yes | QMessageBox::No);
        if (button == QMessageBox::No) {
            close();
        }
        else if (button == QMessageBox::Yes) {
            if(game_save()) close();  //接受退出信号，程序退出
        }

}

bool MainWindow::game_save()
{
    QTextDocument *document=Q_NULLPTR;
    QTextBlock textBlock;
    document=save_rec->document();
    textBlock=document->begin();
    if(textBlock.text()==""){
            QMessageBox::information(this,"提示","请在右侧输入要保存的游戏名后再点击保存按钮");
            return false;
    }

    QString str;
    for(;textBlock!=document->end();textBlock=textBlock.next()){
            str += textBlock.text();
    }

    QDateTime current_time = QDateTime::currentDateTime();
    QString StrCurrentTime = current_time.toString("yyyy-MM-dd hh:mm:ss");

    QDir *dir=new QDir("D:/record/");
    QStringList filter;
    filter<<"*.txt";
    dir->setNameFilters(filter);
    QFileInfoList fileInfoList=dir->entryInfoList(filter);
    int n = fileInfoList.count();

    QFile ofile("D:/record/record.txt");
    ofile.open(QIODevice::ReadOnly | QIODevice::Text);
    int i = 0;
    while(!ofile.atEnd()){
        QString judge(ofile.readLine());
        i++;
        if(!(i%2) && str+'\n' == judge){
            QMessageBox::information(this,"warning","this name is used");
            ofile.close();
            return false;
        }
    }
    ofile.close();


    ofile.open(QIODevice::ReadWrite | QIODevice::Append);
    QTextStream txtOutput(&ofile);
    txtOutput << QString::number(n) << '\n';
    txtOutput << str << '\n';
    txtOutput << StrCurrentTime << '\n';
    ofile.close();

    QFile ifile("D:/record/"+QString::number(n)+".txt");
    ifile.open(QIODevice::ReadWrite);
    for(int i=0;i<9;++i){
        for(int j=0;j<9;j++){
            QTextStream txtinput(&ifile);
            txtinput << grid->get_value(i,j);
            grid->status_reset(i,j,0);
        }
    }
    ifile.close();

    QMessageBox::information(this,"提示","保存成功！");

    return true;

}

void MainWindow::game_load()
{
    QString str;

    if(rec_btn->str==""){
        QFile sfile("D:/record/record.txt");
        sfile.open(QIODevice::ReadOnly | QIODevice::Text);
        str = sfile.readAll();
        if(str=="") {
            save_rec->setPlainText("没有存档");
            sfile.close();
            return ;
        }

        else {
            sfile.open(QIODevice::ReadOnly | QIODevice::Text);
            save_rec->setPlainText(str);
            sfile.close();
            return ;
        }
    }

    game_clear();

    QFile rfile("D:/record/"+rec_btn->str+".txt");
    if(!rfile.open(QIODevice::ReadOnly)) {
        QMessageBox::warning(this,"warning","请输入正确的序号");
        return;
    }

    QString new_str = rfile.readAll();
    for(int i=0;i<9;i++){
        for(int j=0;j<9;j++){
            grid->status_reset(i,j,QString(new_str[i*9+j]).toInt());
        }
    }
    rfile.close();
}

void MainWindow::rec_selected(recbtn* rec)
{
    grid->free_selection();
    rec->setFocus();
}

void MainWindow::rec_chosen(QString str_)
{
    rec_btn->str.clear();
    rec_btn->str = str_;
    game_load();
}

void MainWindow::game_solve()
{
    grid->game_solve();
    //qDebug()<<"ee";
    //*(threadA.sudoku) = grid->initial_sudoku;

    //threadA.start();
}

void MainWindow::game_solve_plus()
{
    grid->game_solve_GBFS();
}

void MainWindow::game_hint()
{
    grid->game_hint();
}

void MainWindow::game_help()
{
    QMessageBox::information(this,"操作提示","1.点击new按钮以随机生成一个新数独（不保证有解）\n"
                                            "2.点击clear按钮以自定义数独。输入完成后需先保存再求解\n"
                                            "3.点击solve按钮以求解数独。solve后将无法再重新填写，请慎用\n"
                                            "4.点击hint按钮以获取提示\n"
                                            "5.点击save按钮以保存当前游戏。需先在右侧输入记录名称后再保存\n"
                                            "6.点击load按钮以读取存档。在右下角输入相应序号后点击load按钮以获得相应游戏\n"
                                            "7.点击exit按钮以退出游戏。退出前需确认是否需要存档\n");
}

void MainWindow::threadA_solve(Sudoku sd)
{
    grid->thread_set(sd);
}
