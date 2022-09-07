#ifndef DB_H
#define DB_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlQueryModel>
#include <QVariant>
#include "parentrecord.h"


class RecordModel;
class Composition;

class DbController : public QObject
{
    Q_OBJECT
private:
    QSqlDatabase sdb;

private:
    bool execFile(const QPair<QString, QString> &fileName);
    QList<QString> getRecordByScript(const QString& script) const;
public :

public:
    explicit DbController(QObject *parent = nullptr);
    void sell(int recordId, int count);
    QPair<float, float> getPrice(int recordId);
    QSqlQueryModel *selectAnsamblePerformanceCount();
    QStringList selectParamsForEnsembleName(const QVariant &ensembleName);
    QSqlQueryModel* getTopSales();
    QList<QSharedPointer<ParentRecord> > getRecords() const;
    QList<QString> getFromRecords(const QString &key) const;
    QList<QString> getFromEnsembles() const;
    QList<QString> getEnsembleTypes() const;
    QList<QString> getInstruments() const;
    QList<QString> getMusicians() const;


    QList<QSharedPointer<ParentRecord>> getCompositionsForRecord(int recordId, QString &key);

    QList<QSharedPointer<ParentRecord> > getEnsemble() const;
    QList<QSharedPointer<ParentRecord> > getMusiciansForEnsemble(int ensembleId, QString &key);


    void insertRecords(QMap<QString, QString> &records);
    void deleteRecords(QMap<QString, QString> &records);

    void insertEnsembles(QMap<QString, QString> &records);
    void delEnsemble(QMap<QString, QString> &records);

    void insertMusicians(QMap<QString, QString> &records);
    void deleteMusicians(QMap<QString, QString> &records);



    void updateRecord(QMap<QString, QString> &map);
    void insertCompositions(QMap<QString, QString> &records);
    void deleteCompositions(QMap<QString, QString> &records);


signals:

};

#endif // DB_H
