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
    connect(this, &DatabaseActions::sendImage, this, &DatabaseActions::sendImageHandler);
    connect(this, &DatabaseActions::getImage, this, &DatabaseActions::getImageHandler);
}



// TODO - For uploading and retrieving images for user-enetered recipes, use the block storage/another storage service provided by Oracle free tier.
//        Then, store a link/identifier/useful information for accessing the image in the "image" field in the database
//        Can use images by getting them from an HTTP request/API call to a VPS. The URL is used as the source string for the Image component,
//        and the VPS responds with the image




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
    myurl.setScheme(DB_SCHEME);
    myurl.setHost(HOST);
    myurl.setPath(INSERT_RECIPE_PATH);
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
    myurl.setScheme(VPS_SCHEME);
    myurl.setHost(HOST);
    myurl.setPort(PORT);
    myurl.setPath(GENERIC_REQUEST_PATH);
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

void DatabaseActions::sendImageHandler(QString toSend) {

    qDebug() << "GO ------------------------------------------------------------";

    QString filepath = toSend;

    QString filename = filepath.split("/").at(filepath.split("/").length() - 1);
    QString extension = filename.split(".").at(1);
    filename = filename.split(".").at(0);

    QUrl myurl;
    myurl.setScheme(VPS_SCHEME);
    myurl.setHost(HOST);
    myurl.setPort(PORT);
    myurl.setPath(UPLOAD_IMAGE_PATH);

    QNetworkRequest request;
    request.setUrl(myurl);
    request.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/" + extension));
    request.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("attachment; filename=\"" + filename + "\""));

    qDebug() << "Good so far";

    // TODO
    fileLoc = QStandardPaths::writableLocation(QStandardPaths::PicturesLocation);
    qDebug() << fileLoc;
    emit fileLocChanged();

    // TODO imagePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"image\""));
    QFile *file = new QFile(filepath);
    file->open(QIODevice::ReadOnly);

    qDebug() << "Opened file";

    QNetworkAccessManager *restclient; //in class
    restclient = new QNetworkAccessManager(); //constructor

    file->setParent(restclient); // Cannot delete the file now, so delete it with the restclient

    responseReader = restclient->post(request, file->readAll());

    qDebug() << "Sent file";
}

// TODO Not tested (probably not working)
void DatabaseActions::getImageHandler(QString iName, QImage img) {
    QBuffer buffer;
    buffer.open(QIODevice::WriteOnly);
    img.save(&buffer, "PNG");
    buffer.close();

    QString path = QStandardPaths::writableLocation(QStandardPaths::PicturesLocation) + iName;
    QFile file( path  );
    if( file.open( QIODevice::WriteOnly ) )
    {
        file.write( buffer.buffer() );
        file.close();
    }
    if( file.error() != QFileDevice::NoError )
         qDebug() << QString("Error writing file '%1':").arg(path) <<  file.errorString();
}
