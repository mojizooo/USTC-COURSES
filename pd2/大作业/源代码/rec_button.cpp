#include <rec_button.h>

recbtn::recbtn(int rec,QWidget *parent)
    : QLabel(parent),
      rec(rec),
      is_selected(false),
      str("")
{
    QString text_color = "#000000",
            bg_color = "#DDDDDD",
            font_style = "normal",
            font_weight = "normal";
    setStyleSheet("background-color: " + bg_color + ";"
                  "color: " + text_color + ";"
                  "font-style: " + font_style + ";"
                  "font-weight: " + font_weight + ";");
}

void recbtn::selected()
{
    is_selected = true;

}

void recbtn::mousePressEvent(QMouseEvent *event)
{
    emit selected_signal(this);
}

void recbtn::keyPressEvent(QKeyEvent *event)
{
    int key = event->key();

    if(key == Qt::Key_Backspace){
        str = str.left(str.size()-1);
        setText(str);

    }

    if(Qt::Key_0 <= key && key <= Qt::Key_9){
        int val = key - Qt::Key_0;
        update_text(val);
    }
}

void recbtn::update_text(int x)
{
    this->str+=QString::number(x);
    setText(str);
}
