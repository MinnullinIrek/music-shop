#ifndef PARENTRECORD_H
#define PARENTRECORD_H

#include <QVector>
#include <QVariant>

class ParentRecord
{
protected:

    QVector<QString> values;
public:
    ParentRecord(QVector<QString> &&vals);
    virtual ~ParentRecord();
    virtual QString get(int i) const ;

    virtual int getColumnsCount() const;
    virtual int getId() const;

};

#endif // PARENTRECORD_H
