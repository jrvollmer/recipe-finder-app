#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QRect>
#include <QScreen>
#include "contextobject.h"

// TODO For database actions
#include <QUrlQuery>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkAccessManager>


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


    // TODO Insert data via a REST API call
    QUrlQuery querystr;
    querystr.addQueryItem("field1","Wazzup");
    querystr.addQueryItem("field2",QString::fromStdString(std::to_string(1)));

    QUrl myurl;
    myurl.setScheme("https");
    myurl.setHost("***REMOVED***");
    myurl.setPath("/ords/admin/test-select/api/add-row-1");
    myurl.setQuery(querystr);

    QNetworkRequest request;
    request.setUrl(myurl);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *restclient; //in class
    restclient = new QNetworkAccessManager(); //constructor
    QNetworkReply *reply = restclient->get(request);
    qDebug() << reply->readAll();



    qreal ratio = QGuiApplication::primaryScreen()->devicePixelRatio();
    QRect rect = QGuiApplication::primaryScreen()->geometry();

    qreal height = rect.height();
    qreal width = rect.width();

    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << ratio;

    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << height;
    qDebug() << "----------------------------------------------------------------------------------------------------------------------------------------" << width;


    return app.exec();
}
