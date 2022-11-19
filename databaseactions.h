#ifndef DATABASEACTIONS_H
#define DATABASEACTIONS_H

#include <QObject>

// Database information
#include "dbinfo.h"

// TODO For database actions
#include <QImage>
#include <QByteArray>
#include <QHttpPart>
#include <QStandardPaths>
#include <QFile>
#include <QBuffer>
#include <QUrlQuery>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkAccessManager>

class DatabaseActions : public QObject
{
    Q_OBJECT

    // TODO
    Q_PROPERTY(QString fileLoc MEMBER fileLoc NOTIFY fileLocChanged)

public:
    explicit DatabaseActions(QObject *parent = nullptr);
public slots:
    void addDataHandler(QString name, QString description, QString ingredients, QString steps, QString prep, QString active, QString passive, QString yield);
    void getGenDataHandler(QString imagePath);
    void readResponse();
    void sendImageHandler(QString toSend);
    void getImageHandler(QString iName, QImage img);
signals:
    void addData(QString name, QString description, QString ingredients, QString steps, QString prep, QString active, QString passive, QString yield);
    void getGenData(QString imagePath);
    void sendImage(QString toSend);
    void getImage(QString iName, QImage img);

    // TODO
    void fileLocChanged();
private:
    QNetworkReply* responseReader;

    // TODO
    QString fileLoc;
};

#endif // DATABASEACTIONS_H
