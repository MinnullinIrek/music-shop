#include "parentrecord.h"

ParentRecord::ParentRecord(QVector<QString> &&vals):

    values(vals)

{

}

ParentRecord::~ParentRecord()
{

}

QString ParentRecord::get(int i) const
{
    if(values.count()>i)
        return values.at(i);
    return QString();
}



int ParentRecord::getColumnsCount() const
{
    return  values.count();
}


int ParentRecord::getId() const
{
    return values.last().toInt();
}
