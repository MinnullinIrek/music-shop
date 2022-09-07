#ifndef PARENTMODEL_H
#define PARENTMODEL_H
#include <QAbstractTableModel>
#include <QSharedPointer>
#include <QVariant>

#include "parentrecord.h"

class DbController;

class ParentModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    QMap <QString, int> recordKeys ;
public:
    explicit ParentModel(QVector<QString> &&hdrs, std::function<QList<QSharedPointer<ParentRecord> > (DbController *, bool, int, QString&)> &&selectFunc,
                         std::function<void(DbController *db, QMap<QString, QString>&)> &&insertFunc,
                         std::function<void(DbController *db, QMap<QString, QString>&)> &&update,
                         std::function<void(DbController *db, QMap<QString, QString>&)> &&deleteF,
                         QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    QVariant headerData(int section, Qt::Orientation orientation,
                            int role = Qt::DisplayRole) const override;
    virtual void setDb(DbController *db);
    Qt::ItemFlags flags(const QModelIndex & /*index*/) const override;
    void setKeys( QMap <QString, int> &&keys);
protected:
    QList<QSharedPointer<ParentRecord>> records;
    DbController *db;
    QVector<QString> headers;
    int countOfColumns;
    std::function<QList<QSharedPointer<ParentRecord>>(DbController *db, bool isSubTable, int id, QString &subKey)> select;
    std::function<void(DbController *db, QMap<QString, QString>&)> insert;
    std::function<void(DbController *db, QMap<QString, QString>&)> update;
    std::function<void(DbController *db, QMap<QString, QString>&)> deleteF;

    int currentRow=0;

    int subId = 0;
    QString subKey;

signals:
    void selectionChanged(int recordId);

public slots:
    void recordSelected(const QModelIndex &current, const QModelIndex &);
    void getRecord(int ensembleId);
    void insertRecord(QMap<QString, QString> &records);
    void deleteRecord();
    void insertSubRecord(QMap<QString, QString> &records);
    void updateAfterSale();

};

#endif // PARENTMODEL_H
