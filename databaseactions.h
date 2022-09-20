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
    void addDataHandler(QString field1, int field2);
signals:
    void addData(QString field1, int field2);
};

#endif // DATABASEACTIONS_H
