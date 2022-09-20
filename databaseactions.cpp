#include "databaseactions.h"

/**
 * @brief DatabaseActions::DatabaseActions
 *        DatabaseActions is used to interface with the cloud database
 * @param parent Parent object
 */
DatabaseActions::DatabaseActions(QObject *parent)
    : QObject{parent}
{
    // Connect addData() signal to the addDataHandler() slot
    connect(this, &DatabaseActions::addData, this, &DatabaseActions::addDataHandler);
}


/**
 * @brief DatabaseActions::addDataHandler
 *        A temporary method to insert data into the database
 */
void DatabaseActions::addDataHandler(QString field1, int field2) {
    // TODO Include QOCIDriver so that I can interface with the Oracle Cloud Interface (OCI)
    //      https://doc.qt.io/qt-6/qsqldatabase.html#registerSqlDriver


    // TODO Insert data via a REST API call
    QUrlQuery querystr;
    querystr.addQueryItem("field1", field1);
    querystr.addQueryItem("field2", QString::fromStdString(std::to_string(field2)));

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
}
