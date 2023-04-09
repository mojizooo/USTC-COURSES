#ifndef REC_BUTTON_H
#define REC_BUTTON_H

#include <QtWidgets>
#include <font.h>

class recbtn : public QLabel
{
    Q_OBJECT
public:
    explicit recbtn(int rec, QWidget *parent = 0);
    void update_text(int x);
    QString str;
signals:
    void selected_signal(recbtn*);
public slots:
    void selected();
protected:
    void mousePressEvent(QMouseEvent*);
    void keyPressEvent(QKeyEvent*);
private:
    bool is_selected;
    int rec;
};

#endif // REC_BUTTON_H
