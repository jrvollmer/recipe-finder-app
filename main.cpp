#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QRect>
#include <QScreen>
#include "contextobject.h"

int main(int argc, char *argv[])
{
    /*argc = 3;
        argv[0] = (char*)"Appname";
        argv[1] = (char*)"--platform";
        argv[2] = (char*)"android:dpiawareness=0";
*/
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext * rootContext = engine.rootContext();
    ContextObject ctxt = ContextObject(1);

    rootContext->setContextProperty("scaleCtx", &ctxt);
    const QUrl url(u"qrc:/recipe-finder-app/main.qml"_qs);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    //QGuiApplication::primaryScreen()->geometry().setHeight(2340);
    //QGuiApplication::primaryScreen()->geometry().setWidth(1080);



    // TODO Include QOCIDriver so that I can interface with the Oracle Cloud Interface (OCI)
    //      https://doc.qt.io/qt-6/qsqldatabase.html#registerSqlDriver



    qreal ratio = QGuiApplication::primaryScreen()->devicePixelRatio();
    QRect rect = QGuiApplication::primaryScreen()->geometry();

    qreal height = rect.height();
    qreal width = rect.width();

    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << ratio;

    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << height;
    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << width;


    return app.exec();
}
