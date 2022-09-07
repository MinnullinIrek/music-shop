#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QStandardItemModel>
#include <QSqlTableModel>
#include "db.h"
#include "ParentModel.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , db(new DbController(this))
    , ui(new Ui::MainWindow)
    , listModel(new QStandardItemModel(this))
{
    ui->setupUi(this);



    auto model = db->selectAnsamblePerformanceCount();

    ui->ensembleLV->setModel(model);

    connect(ui->ensembleLV->selectionModel(), &QItemSelectionModel::selectionChanged,
            this,  &MainWindow::handleSelectionChanged);

    QObject::connect(ui->musiciansTV->selectionModel(),
                     &QItemSelectionModel::selectionChanged,
                     this, &MainWindow::handleSelectionChanged);

    ui->topSales->setModel(db->getTopSales());



    ParentModel *recModel = new ParentModel( {"Диск","Дата", "Производитель", "Оптовый адрес", "Количество"},
                                             [](DbController *db, bool isSubTable, int, QString& ){return isSubTable?QList<QSharedPointer<ParentRecord>>():db->getRecords();},
            [](DbController *db, QMap<QString, QString> &records){db->insertRecords(records);},
    [](DbController *db, QMap<QString, QString> &records){db->updateRecord(records);},
    [](DbController *db, QMap<QString, QString> &records){db->deleteRecords(records);}
    );
    recModel->setKeys({{ "recordId", 5},
                       { "recordName",0},
                       { "recordDate",1},
                       { "companyName",2},
                       { "adress",3},
                       {"recordsCount", 4}});
    recModel->setDb(db);

    ui->recordsTV->setModel(recModel);


    ParentModel *compModel = new ParentModel({"Произведения", "Автор", "Ансамбль"},
                                             [](DbController *db, bool isSubTable, int id, QString& key){return isSubTable?db->getCompositionsForRecord(id,key):QList<QSharedPointer<ParentRecord>>();},
            [](DbController *db, QMap<QString, QString> &records){db->insertCompositions(records);},
    [](DbController *, QMap<QString, QString> &){/*db->updateRecord(records);*/},
    [](DbController *db, QMap<QString, QString> &records){db->deleteCompositions(records);}

    );

    compModel->setDb(db);
    compModel->setKeys({   { "compositionName",0},
                           { "compositor",1},
                           {  "ansembleName",2},
                           { "performanceId",3},
                           { "compositionId",4},
                           { "ensembleId",5},
                           { "directorId",6},
                           { "compositorId",7},
                           { "recordId", 9},
                       });




    QObject::connect(ui->recordsTV->selectionModel(),
                     &QItemSelectionModel::currentChanged,
                     recModel, &ParentModel::recordSelected);



    QObject::connect(recModel, &ParentModel::selectionChanged,
                     compModel, &ParentModel::getRecord);

    ui->performanceTV->setModel(compModel);
    QObject::connect(ui->performanceTV->selectionModel(),
                     &QItemSelectionModel::currentChanged,
                     compModel, &ParentModel::recordSelected);
    ParentModel *ensModel = new ParentModel( {"Ансамбли","Руководитель","Тип ансамбля"},
                                             [](DbController *db, bool isSubTable, int, QString& ){return isSubTable?QList<QSharedPointer<ParentRecord>>():db->getEnsemble();},
            [](DbController *db, QMap<QString, QString> &records){db->insertEnsembles(records);},
    [](DbController *, QMap<QString, QString> &){/*db->updateRecord(records);*/},
    [](DbController *db, QMap<QString, QString> &records){db->delEnsemble(records);}

    );
    ensModel->setDb(db);
    ensModel->setKeys({{"ensembleName", 0},
                       {"director", 1},
                       {"ensembleType", 2},
                       {"ensembleTypeid", 3},
                       {"ensembleId", 4}
                      });

    ui->ensembleTV->setModel(ensModel);



    ParentModel *musModel = new ParentModel({"Участник", "Инструмент"},
                                            [](DbController *db, bool isSubTable, int id, QString& key){return isSubTable?db->getMusiciansForEnsemble(id,key):QList<QSharedPointer<ParentRecord>>();},
            [](DbController *db, QMap<QString, QString> &records){db->insertMusicians(records);},
    [](DbController *, QMap<QString, QString> &){/*db->updateRecord(records);*/},
    [](DbController *db, QMap<QString, QString> &records){db->deleteMusicians(records);}
    );



    musModel->setDb(db);
    musModel->setKeys({{"name", 0},
                       {"instrument", 1},
                       {"musicianId", 2},
                       {"instrumentId", 3},
                       {"performerId", 4},
                       {"ensembleId", 5}
                      });

    ui->musiciansTV->setModel(musModel);
    QObject::connect(ui->ensembleTV->selectionModel(),
                     &QItemSelectionModel::currentChanged,
                     ensModel,
                     &ParentModel::recordSelected
                     );

    QObject::connect(ensModel, &ParentModel::selectionChanged,
                     musModel, &ParentModel::getRecord
                     );


    QObject::connect(ui->addRecord, &QPushButton::clicked, this, &MainWindow::addRecordButtonPush);
    QObject::connect(ui->addCompBT, &QPushButton::clicked, this, &MainWindow::addCompButtonPush);
    QObject::connect(ui->addEnsembleBT, &QPushButton::clicked, this, &MainWindow::addEnsemleButtonPush);
    QObject::connect(ui->addMusiciansBT, &QPushButton::clicked, this, &MainWindow::addMusButtonPush);




    ui->companyCB->addItems(db->getFromRecords("companyName"));
    ui->adressCb->addItems(db->getFromRecords("adress"));
    ui->ensembleCB->addItems(db->getFromEnsembles());

    QObject::connect(this, &MainWindow::insertRecord, recModel, &ParentModel::insertRecord);
    QObject::connect(this, &MainWindow::insertEnsemble, ensModel, &ParentModel::insertRecord);

    QObject::connect(ui->deleteBT, &QPushButton::clicked, recModel, &ParentModel::deleteRecord);
    QObject::connect(this, &MainWindow::insertComp, compModel, &ParentModel::insertSubRecord);
    QObject::connect(this, &MainWindow::insertMusicians, musModel, &ParentModel::insertSubRecord);
    QObject::connect(ui->delCompBT, &QPushButton::clicked, compModel, &ParentModel::deleteRecord);
    QObject::connect(ui->delEnsembleBT, &QPushButton::clicked, ensModel, &ParentModel::deleteRecord);
    QObject::connect(ui->delMusiciansBT, &QPushButton::clicked, musModel, &ParentModel::deleteRecord);
    QObject::connect(ui->sellBT, &QPushButton::clicked, this, &MainWindow::sell);


    QObject::connect(recModel, &ParentModel::selectionChanged, this, &MainWindow::getSelectionRecords);
    QObject::connect(this, &MainWindow::updateAfterSale, recModel, &ParentModel::updateAfterSale);

    ui->ensembleCB_2->addItems(db->getEnsembleTypes());
    ui->instrumentCB->addItems(db->getInstruments());
    ui->directorsCB->addItems(db->getMusicians());


    QObject::connect(ui->musiciansTV->selectionModel(),
                     &QItemSelectionModel::currentChanged,
                     musModel, &ParentModel::recordSelected);
    QObject::connect(ui->performanceTV->selectionModel(),
                     &QItemSelectionModel::currentChanged,
                     compModel, &ParentModel::recordSelected);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleSelectionChanged(QItemSelection last, QItemSelection )
{
    QString s = last.indexes().first().data().toString();

    ui->performanceLV->clear();
    auto compositions = db->selectParamsForEnsembleName(s);
    ui->performanceLV->addItems(compositions);
    ui->performanceCount->setText(QString("%0").arg(compositions.count()));
}

void MainWindow::addRecordButtonPush()
{
    QMap<QString, QString> map;

    map["recordName"] = ui->recordLE->text();
    map["year"] = ui->yearLE->text();
    map["companyName"] = ui->companyCB->currentText();
    map["adress"] = ui->adressCb->currentText();

    emit insertRecord(map);
}

void MainWindow::addCompButtonPush()
{
    QMap<QString, QString> map;

    map["compositionName"] = ui->compLE->text();
    map["compositor"] = ui->authorLE_2->text();
    map["ensembleName"] = ui->ensembleCB->currentText();

    emit insertComp(map);
}

void MainWindow::addEnsemleButtonPush()
{
    QMap<QString, QString> map;

    map["ensembleName"] = ui->ensembleLE->text();
    map["director"] = ui->directorsCB->currentText();
    map["ensembleType"] = ui->ensembleCB_2->currentText();

    emit insertEnsemble(map);
}

void MainWindow::addMusButtonPush()
{
    QMap<QString, QString> map;

    map["name"] = ui->musicicaLE->text();
    map["instrument"] = ui->instrumentCB->currentText();

    emit insertMusicians(map);
}

void MainWindow::getSelectionRecords(int recordId)
{
    this->recordId = recordId;
    auto prices = db->getPrice(recordId);
    ui->retailPrice->setText( QString::number(prices.first));
    ui->wholePrice->setText(QString::number(prices.second));
}

void MainWindow::sell()
{
    int count = ui->countLE->text().toInt();
    db->sell(recordId, count);
    emit updateAfterSale();
}

