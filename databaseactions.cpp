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
    connect(this, &DatabaseActions::getGenData, this, &DatabaseActions::getGenDataHandler);
}



// TODO - For uploading and retrieving images for user-enetered recipes, use the block storage/another storage service provided by Oracle free tier.
//        Then, store a link/identifier/useful information for accessing the image in the "image" field in the database




/**
 * @brief DatabaseActions::addDataHandler
 *        A temporary method to insert data into the database
 */
void DatabaseActions::addDataHandler(QString name, QString description, QString ingredients, QString steps, QString prep, QString active, QString passive, QString yield) {
    // TODO Include QOCIDriver so that I can interface with the Oracle Cloud Interface (OCI)
    //      https://doc.qt.io/qt-6/qsqldatabase.html#registerSqlDriver


    // TODO Insert data via a REST API call
    QUrlQuery querystr;
    querystr.addQueryItem("name", name);
    querystr.addQueryItem("description", description);
    querystr.addQueryItem("ingredients", ingredients);
    querystr.addQueryItem("steps", steps);
    querystr.addQueryItem("prep_time", prep);
    querystr.addQueryItem("cook_time", active);
    querystr.addQueryItem("total_time", passive); // TODO passive time is not total time
    querystr.addQueryItem("yield", yield);

    QUrl myurl;
    myurl.setScheme("https");
    myurl.setHost("***REMOVED***"); // TODO Put this (and other database info) in constants file that is ignored by Git
    myurl.setPath("***REMOVED***");
    myurl.setQuery(querystr);

    QNetworkRequest request;
    request.setUrl(myurl);
    //request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *restclient; //in class
    restclient = new QNetworkAccessManager(); //constructor
    QNetworkReply *reply = restclient->get(request);
    qDebug() << reply->readAll();
}


void DatabaseActions::getGenDataHandler(QString imagePath) {
    //QUrlQuery querystr;
    //querystr.addQueryItem("path", imagePath);

    qDebug() << "--------------------------_-_____-------------------------------------------------------------------------------------------------------------";

    QUrl myurl;
    myurl.setScheme("http");
    myurl.setHost("hostname"); // TODO Put this (and other database info) in constants file that is ignored by Git
    myurl.setPort(9999);
    myurl.setPath("/api");
    //myurl.setQuery(querystr);

    QNetworkRequest request;
    request.setUrl(myurl);
    //request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *restclient; //in class
    restclient = new QNetworkAccessManager(); //constructor
    responseReader = restclient->get(request);
    connect(this->responseReader, &QNetworkReply::readyRead, this, &DatabaseActions::readResponse);
}

void DatabaseActions::readResponse() {
    qDebug() << "From VPS: " << responseReader->readAll();
}
