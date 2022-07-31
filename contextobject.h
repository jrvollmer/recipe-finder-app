#ifndef CONTEXTOBJECT_H
#define CONTEXTOBJECT_H

#include <QObject>

class ContextObject : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int scale MEMBER scale NOTIFY contextChanged);

public:
    explicit ContextObject(int scaleNum, QObject *parent = nullptr);

signals:
    void contextChanged();
private:
    int scale;
};

#endif // CONTEXTOBJECT_H
