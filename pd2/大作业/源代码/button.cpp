#include <button.h>

Button::Button(QWidget *parent)
    : QPushButton(parent)
{
    is_mouse_over = false;
    is_mouse_pressed = false;
    setFixedSize(30,30);
}

void Button::paintEvent(QPaintEvent *)
{
    QRect rect = this->rect();
    QPainter p(this);
    QPixmap bg(image_path);
    bg = bg.scaled(rect.width(), rect.height(),
                   Qt::KeepAspectRatio, Qt::SmoothTransformation); //自适应改变图片比例并饱满填充(按比例填充)
    p.drawPixmap(QPoint(0, 0), bg);
    if(is_mouse_pressed)
    {
        p.setCompositionMode(QPainter::CompositionMode_Multiply);  //按下按钮时图标颜色变深
        p.drawPixmap(QPoint(0, 0), bg);
    }
    else if(is_mouse_over) {
        p.setCompositionMode(QPainter::CompositionMode_HardLight); //悬停时图标变亮
        p.drawPixmap(QPoint(0, 0), bg);
    }
}

void Button::mousePressEvent(QMouseEvent *ev)
{
    if(ev->button() == Qt::LeftButton)
        is_mouse_pressed = true;
    QPushButton::mousePressEvent(ev);
}

void Button::mouseReleaseEvent(QMouseEvent *ev)
{
    if(ev->button() == Qt::LeftButton)
        is_mouse_pressed = false;
    QPushButton::mouseReleaseEvent(ev);
}

void Button::enterEvent(QEnterEvent *ev)
{
    is_mouse_over = true;
    QPushButton::enterEvent(ev);
}

void Button::leaveEvent(QEvent *ev)
{
    is_mouse_over = false;
    QPushButton::leaveEvent(ev);
}

void Button::set_image(QString path)
{
    image_path = path;
}
