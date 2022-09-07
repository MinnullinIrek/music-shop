#include "db.h"
#include <QSqlError>
#include <QtDebug>
#include <QSqlQuery>
#include <QFile>
#include <QMessageBox>
#include <QVector>
#include <QTextStream>
#include <QPair>
#include <QSharedPointer>

bool DbController::execFile(const QPair<QString, QString> &fileNameDelimeter)
{
    QSqlQuery query(sdb);
    QFile scriptFile(fileNameDelimeter.first);
    if(!scriptFile.exists())
    {
        QMessageBox::warning(0, "ошибка", QString("Не удалось обнаружить файл.  %0 %1").arg(fileNameDelimeter.first).arg(query.lastError().text()));

    }

    if(!scriptFile.open(QIODevice::ReadOnly)) {
        QMessageBox::warning(0, "ошибка", QString("Не удалось открыть файл. %0").arg(fileNameDelimeter.first));
        return false;
    }


    QStringList scriptQueries = QTextStream(&scriptFile).readAll().split(fileNameDelimeter.second);

    for (auto& queryTxt: scriptQueries) {
        if (queryTxt.trimmed().isEmpty()) {
            continue;
        }
        if (!query.exec(queryTxt+fileNameDelimeter.second)) {
            QMessageBox::warning(0,"Ошибка",(QString("Ошибка в одном из запросов.В файле %0 %1")
                                             .arg(fileNameDelimeter.first)
                                             .arg(query.lastError().text())));
            return false;
        }
        query.finish();
    }

    return true;
}

QList<QString> DbController::getRecordByScript(const QString &script) const
{
    QList<QString> records;
    QSqlQuery query;
    if(!query.exec(script)){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
    while(query.next()){
        records.append(query.value(0).toString());
    }
    return records;
}

DbController::DbController(QObject *parent)
    : QObject{parent},
      sdb( QSqlDatabase::addDatabase("QSQLITE"))
{
    sdb.setDatabaseName("music_shop.sqlite");

    if (!sdb.open()) {
        QMessageBox::warning(0, "ошибка", sdb.lastError().text());
    }

}



void DbController::sell(int recordId, int soldCount)
{
    QSqlQuery query(sdb);

     query.prepare("INSERT INTO  sales ( recordId, soldCount) VALUES (:recordId, :soldCount)");

    query.bindValue(":recordId", recordId);
    query.bindValue(":soldCount", soldCount);



    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }


}

QPair<float, float>  DbController::getPrice(int recordId)
{
    QSqlQuery query;
    query.prepare(QString("SELECT * FROM price WHERE recordId = :recordId"));
    query.bindValue(":recordId", recordId);

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
    query.next();

    return {query.value(1).toFloat(), query.value(2).toFloat()};
}

QSqlQueryModel *DbController::selectAnsamblePerformanceCount()
{
    QSqlQueryModel *querymodel = new QSqlQueryModel;
    querymodel->setQuery("SELECT DISTINCT name FROM ensemble_performances ;");

    return querymodel;
}

QStringList DbController::selectParamsForEnsembleName(const QVariant &ensembleName)
{
    QSqlQuery query(sdb);
    query.prepare("SELECT DISTINCT compositianName FROM ensemble_performances WHERE name = :name");
    query.bindValue(":name", ensembleName);
    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }

    QStringList vec;
    vec.reserve(query.size());
    while(query.next()){
        vec.append(query.value(0).toString());
    }
    return vec;
}

QSqlQueryModel *DbController::getTopSales()
{
    QSqlQueryModel *querymodel = new QSqlQueryModel;
    querymodel->setQuery("SELECT  recordName, soldCount FROM sold_records ;");

    return querymodel;
}

QList<QSharedPointer<ParentRecord>> DbController::getRecords() const
{
    QSqlQuery query;
    QList<QSharedPointer<ParentRecord>> records;

    if(!query.exec("SELECT * FROM simple_records;")){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
    records.reserve(query.size());

    while(query.next()){
        records.append(QSharedPointer<ParentRecord>::create(ParentRecord(
                                                                { query.value(1).toString()
                                                                  , query.value(2).toString()
                                                                  ,query.value(3).toString()
                                                                  ,query.value(4).toString()
                                                                   ,query.value(5).toString()
                                                                  , query.value(0).toString()}

                                                                )));
    }


    return records;
}

QList<QString> DbController::getFromRecords(const QString &key) const
{
    QList<QString> records;

    QSqlQuery query;

    if(!query.exec("SELECT * FROM simple_records;")){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
    records.reserve(query.size());

    while(query.next()){
        records.append(query.value(key).toString());
    }


    return records;
}

QList<QString> DbController::getFromEnsembles() const
{
    QSqlQuery query;
    query.prepare(QString("SELECT name FROM ensembles"));

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }



    QList<QString> records;
    while(query.next()){
        records.append(query.value(0).toString());
    }


    return records;
}

QList<QString> DbController::getEnsembleTypes() const
{
    return getRecordByScript("SELECT ensembleType FROM ensemble_types;");
}

QList<QString> DbController::getInstruments() const
{
    return getRecordByScript("SELECT instrument FROM instruments;");
}

QList<QString> DbController::getMusicians() const
{
    return getRecordByScript("SELECT name FROM musicians;");
}

QList<QSharedPointer<ParentRecord>> DbController::getCompositionsForRecord(int recordId, QString& key)
{

    key= "recordId";
    QSqlQuery query;
    query.prepare("SELECT * FROM record_compositions WHERE recordId = :rec;");
    query.bindValue(":rec", recordId);

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }

    qDebug()<<"query.size() " << query.size();

    QList<QSharedPointer<ParentRecord>> records;
    while(query.next()){
        records.append(QSharedPointer<ParentRecord>::create(ParentRecord(
                                                                { query.value(1).toString(),
                                                                  query.value(2).toString(),
                                                                  query.value(3).toString(),
                                                                  query.value(4).toString(),
                                                                  query.value(5).toString(),
                                                                  query.value(6).toString(),
                                                                  query.value(7).toString(),
                                                                  query.value(8).toString(),
                                                                  query.value(9).toString(),
                                                                  query.value(0).toString(),

                                                                })));
    }

    auto t = query.value(4).toString();

    return records;
}

QList<QSharedPointer<ParentRecord>> DbController::getEnsemble() const
{
    QSqlQuery query;
    if(!query.exec("SELECT * FROM simple_ensembles;")){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }


    QList<QSharedPointer<ParentRecord>> records;
    while(query.next()){
        records.append(QSharedPointer<ParentRecord>::create(ParentRecord({ query.value(1).toString()
                                                                           ,query.value(2).toString()
                                                                           ,query.value(3).toString()
                                                                           ,query.value(4).toString()                                                                           
                                                                           ,query.value(0).toString()})));
    }

    return records;
}

QList<QSharedPointer<ParentRecord>> DbController::getMusiciansForEnsemble(int ensembleId, QString &key)
{
    QSqlQuery query;

    key = "ensembleId";
    query.prepare("SELECT * FROM ensemble_musicians WHERE ensembleId = :ens;");
    query.bindValue(":ens", ensembleId);

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }

    QList<QSharedPointer<ParentRecord>> records;
    while(query.next()){
        records.append(QSharedPointer<ParentRecord>::create(ParentRecord({query.value(1).toString()
                                                                          , query.value(2).toString()
                                                                          , query.value(3).toString()
                                                                          , query.value(4).toString()
                                                                          , query.value(5).toString()
                                                                          , query.value(0).toString()
                                                                         })));
    }
    if(records.empty()){
        records.append(QSharedPointer<ParentRecord>::create(ParentRecord({""
                                                                          , ""
                                                                          , ""
                                                                          , QString("%1").arg(ensembleId)

                                                                         })));
    }

    return records;
}

void DbController::insertRecords(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("insert into simple_records(recordName,recordDate,companyName,adress, recordsCount) values  "
                  "(:recordName, :year, :companyName, :adress, :recordsCount ) ");




    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }


}

void DbController::deleteRecords(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("DELETE FROM simple_records WHERE (recordId = :recordId AND companyName=:companyName AND adress=:adress)  ");

    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
}

void DbController::insertEnsembles(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("insert into simple_ensembles(ensembleName,director,ensembleType) values  "
                  "(:ensembleName, :director, :ensembleType ) ");




    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
}

void DbController::delEnsemble(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("DELETE FROM simple_ensembles WHERE ensembleId = :ensembleId");

    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
}

void DbController::insertMusicians(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("insert into ensemble_musicians(ensembleId,name,instrument) values  "
                  "(:ensembleId, :name, :instrument ) ");




    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
}

void DbController::deleteMusicians(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("DELETE FROM ensemble_musicians WHERE (ensembleId = :ensembleId AND performerId=:performerId)  ");

    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
}

void DbController::updateRecord(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("update simple_records set companyName = :companyName, adress = :adress, recordName = :recordName, "
                  "recordDate = :recordDate, recordId = :recordId, recordsCount=:recordsCount where recordId = :recordId;");

    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }
}



void DbController::insertCompositions(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("INSERT INTO record_compositions (recordId, compositionName, compositor, ansembleName)"
                  " VALUES( :recordId, :compositionName, :compositor, :ensembleName)");

    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }


}

void DbController::deleteCompositions(QMap<QString, QString> &records)
{
    QSqlQuery query(sdb);

    query.prepare("DELETE FROM record_compositions WHERE (recordId = :recordId AND performanceId=:performanceId)  ");

    for(auto &key : records.keys()){
        query.bindValue(QString(":%0").arg(key), records[key]);
    }

    if(!query.exec()){
        QMessageBox::warning(0,"ошибка", query.lastError().text());
    }


}




