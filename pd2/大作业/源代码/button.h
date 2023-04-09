#ifndef BUTTON_H
#define BUTTON_H

#include <QtWidgets>

class Button : public QPushButton
{
    Q_OBJECT
public:
    Button(QWidget* parent = 0);
    void set_image(QString);
protected:
    void paintEvent(QPaintEvent *);
    void mousePressEvent(QMouseEvent *);
    void mouseReleaseEvent(QMouseEvent *);
    void enterEvent(QEnterEvent *);
    void leaveEvent(QEvent *);
private:
    bool is_mouse_pressed, is_mouse_over;
    QString image_path;
};
#endif // BUTTON_H
