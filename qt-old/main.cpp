#include <QApplication>
#include <QLabel>
#include <QWidget>
#include <QHBoxLayout>
int main(int argc, char *argv[ ])
{
QApplication app(argc, argv);
QWidget widget;
QVBoxLayout layout;
QLabel label=QLabel("<center>Hello World</center>");
layout.addWidget(&label);
layout.setAlignment(Qt::AlignHCenter);
widget.setLayout(&layout);
widget.show();
return app.exec();
}