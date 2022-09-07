#include "ParentModel.h"

#include "db.h"

ParentModel::ParentModel(QVector<QString> &&hdrs,
                         std::function<QList<QSharedPointer<ParentRecord> > (DbController *, bool, int, QString &)> &&selectFunc,
                         std::function<void (DbController *, QMap<QString, QString> &)> &&insertFunc,
                         std::function<void (DbController *, QMap<QString, QString> &)> &&update,
                         std::function<void (DbController *, QMap<QString, QString> &)> &&deleteF, QObject *parent)
    : QAbstractTableModel(parent)
    ,headers(hdrs)
    ,countOfColumns(headers.count())
    ,select(selectFunc)
    ,insert(insertFunc)
    ,update(update)
    ,deleteF(deleteF)
{

}

int ParentModel::rowCount(const QModelIndex &ind) const
{
    return 1000;
}

int ParentModel::columnCount(const QModelIndex &) const
{
    return countOfColumns;
}

QVariant ParentModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() >= records.size())
        return QVariant();

    QVariant value;

    switch ( role )
    {
    case Qt::DisplayRole: //string
    {
        value = records.at(index.row())->get(index.column());
    }
        break;

    case Qt::EditRole:
    {
        value = records.at(index.row())->get(index.column());
    }
        break;
        //         case Qt::UserRole: //data
        //         {
        //             value = this->values->at(index.row()).getId();
        //         }
        //         break;

    default:
        break;
    }

    return value;
}

bool ParentModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(index.row() < records.count()){
        if (index.isValid() && role == Qt::EditRole) {
            QMap<QString, QString> m ;
            for(QString key : recordKeys.keys()){
                auto tempValue = recordKeys.value(key);
                if(tempValue != index.column()){
                    m[key] = records.at(index.row())->get(tempValue);
                }else{
                    m[key] = value.toString();
                }
            }

            db->updateRecord(m);

            records = db->getRecords();
            emit dataChanged(index, index);

            return true;
        }
    }
    return false;
}

QVariant ParentModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role == Qt::DisplayRole && orientation == Qt::Horizontal) {
        if(headers.count() > section ){
            return headers.at(section);
        }
    }
    return QVariant();
}

Qt::ItemFlags ParentModel::flags(const QModelIndex & /*index*/) const
{
    return Qt::ItemIsSelectable | Qt::ItemIsEditable | Qt::ItemIsEnabled;
}

void ParentModel::setKeys(QMap<QString, int> &&keys)
{
    this->recordKeys = keys;
}

void ParentModel::recordSelected(const QModelIndex &current, const QModelIndex &)
{
    if(current.row() < records.count()){
        currentRow = current.row();
        emit selectionChanged(records.at(current.row())->getId());
    }
}

void ParentModel::getRecord(int ensembleId)
{
    beginInsertRows(index(records.size(), countOfColumns), records.size(), records.size());
    records = select(db, true, ensembleId, subKey);
    emit dataChanged(index(0,0), index(records.size(), countOfColumns));
    this->subId = ensembleId;
    endInsertRows();
}

void ParentModel::insertRecord(QMap<QString, QString> &recs )
{
    beginInsertRows(index(records.size()+1, countOfColumns+1), records.size(), records.size()+1);
    for(QString key : recordKeys.keys()){
        if(!recs.contains(key)){
            recs[key] = records.at(currentRow)->get(recordKeys.value(key));
        }
    }
    insert(db, recs);
    records = select(db, false, 0, subKey);
    emit dataChanged(index(0,0), index(records.size(), countOfColumns));

    endInsertRows();
}

void ParentModel::deleteRecord()
{
    if(currentRow >= 0){


        //        QMap<QString, QString> map; = {{"recordId", records[currentRow]->get(recordKeys.value("recordId")).toString()},
        //                                      {"companyName", records[currentRow]->get(recordKeys.value("companyName")).toString()},
        //                                      {"adress", records[currentRow]->get(recordKeys.value("adress")).toString()}};

        QMap<QString, QString> m ;
        for(QString key : recordKeys.keys()){
            m[key] = records.at(currentRow)->get(recordKeys.value(key));
        }
        //db->deleteRecords(m);
        deleteF(db, m);

        records = select(db, subId>0 ?true:false, subId, subKey);
        emit dataChanged(index(0,0), index(records.size(), countOfColumns));
    }
}

void ParentModel::insertSubRecord(QMap<QString, QString> &recs)
{
    recs[subKey] = QString("%0").arg(subId);
    insert(db, recs);
    records = select(db, true, subId, subKey);
    emit dataChanged(index(0,0), index(records.size(), countOfColumns));
}

void ParentModel::updateAfterSale()
{
    records = select(db, false, 0, subKey);
    emit dataChanged(index(currentRow,countOfColumns-1), index(currentRow, countOfColumns-1));
}

void ParentModel::setDb(DbController *dB)
{
    db = dB;
    records = select(db, false, 0, subKey);
}

