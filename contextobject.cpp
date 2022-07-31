#include "contextobject.h"

ContextObject::ContextObject(int scaleNum, QObject *parent)
    : QObject{parent}
{
    this->scale = scaleNum;

    emit contextChanged();
}
