// myobject.h
#ifndef MYOBJECT_H
#define MYOBJECT_H

#include <QObject>
#include <QVector>

class MyObject : public QObject
{
    Q_OBJECT
public:
    QObject *rootObject;
    explicit MyObject(QObject *parent = nullptr);

signals:
    void buttonClicked();

public slots:
    void onButtonClicked(int state);
};

#endif // MYOBJECT_H
