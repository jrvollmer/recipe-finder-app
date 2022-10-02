#ifndef DATABASEACTIONS_H
#define DATABASEACTIONS_H

#include <QObject>

// TODO For database actions
#include <QUrlQuery>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkAccessManager>

class DatabaseActions : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseActions(QObject *parent = nullptr);
public slots:
    void addDataHandler(QString name, QString description, QString ingredients, QString steps, QString prep, QString active, QString passive, QString yield);
signals:
    void addData(QString name, QString description, QString ingredients, QString steps, QString prep, QString active, QString passive, QString yield);
};

#endif // DATABASEACTIONS_H
