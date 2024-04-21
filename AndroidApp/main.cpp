#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "myobject.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/RandomCoffee/Main.qml")));

    MyObject myObject;
    myObject.rootObject = engine.rootObjects().at(0);
    engine.rootContext()->setContextProperty("myObject", &myObject);

    return app.exec();
}
