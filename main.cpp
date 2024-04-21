#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtSql>
#include <QSql>

#include "myobject.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/RandomCoffee/Main.qml")));

    MyObject myObject;
    myObject.rootObject = engine.rootObjects().at(0);
    engine.rootContext()->setContextProperty("myObject", &myObject);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("https://d440-2a0c-16c0-510-2-00-c9a4.ngrok-free.app/");
    db.setDatabaseName("mydatabase.db");

    if(db.open()) {
        qDebug() << "Connected to SQLITE!";
    } else {
        qWarning() << "Failed to connect to database:" << db.lastError().text();
    }

    // Выполнение SQL запросов
    QSqlQuery query("SELECT * FROM users", db);
    while (query.next()) {
        // Обработка результатов запроса
        QString column1Value = query.value(0).toString(); // Пример чтения значения из первого столбца
        qDebug() << "Value from column 1:" << column1Value;
    }

    // Закрытие соединения с базой данных
    db.close();

    return app.exec();
}
