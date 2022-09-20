#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QRect>
#include <QScreen>
#include <QQmlPropertyMap>
#include "databaseactions.h"

int main(int argc, char *argv[])
{
    /*argc = 3;
        argv[0] = (char*)"Appname";
        argv[1] = (char*)"--platform";
        argv[2] = (char*)"android:dpiawareness=0";
*/

    // Set up a scale context variable to be used in the front end
    QQmlPropertyMap uiProps;
    uiProps.insert("scale", QVariant(1/2.625));
    // Declare a DatabaseActions instance to use as a context property for the front end
    DatabaseActions dbActions;


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext * rootContext = engine.rootContext();

    // Add database actions as a context property that the front end can utilize
    rootContext->setContextProperty("dbActions", &dbActions);
    // Add scale property as a context property for the front end
    rootContext->setContextProperty("uiCtxt", &uiProps);
    const QUrl url(u"qrc:/recipe-finder-app/main.qml"_qs);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    //QGuiApplication::primaryScreen()->geometry().setHeight(2340);
    //QGuiApplication::primaryScreen()->geometry().setWidth(1080);


    qreal ratio = QGuiApplication::primaryScreen()->devicePixelRatio();
    QRect rect = QGuiApplication::primaryScreen()->geometry();

    qreal height = rect.height();
    qreal width = rect.width();

    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << ratio;

    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << height;
    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << width;


    return app.exec();
}
