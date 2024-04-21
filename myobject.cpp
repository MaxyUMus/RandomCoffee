#include "myobject.h"
#include <iostream>
#include <QDebug>

MyObject::MyObject(QObject *parent) : QObject(parent)
{
}

void MyObject::onButtonClicked(int state)
{
    if(state == 0) {

    }
    else if (state == 1) {

    }
}
