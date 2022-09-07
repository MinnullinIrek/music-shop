#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QItemSelection>


class QStandardItemModel;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class DbController;
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    DbController *db;
    Ui::MainWindow *ui;
    QStandardItemModel *listModel;
    int recordId;

public slots:
    void handleSelectionChanged(QItemSelection last, QItemSelection next);
    void addRecordButtonPush();
    void addCompButtonPush();
    void addEnsemleButtonPush();
    void addMusButtonPush();
    void getSelectionRecords(int recordId);
    void sell();

signals:
    void insertRecord(QMap<QString, QString> &records);
    void insertEnsemble(QMap<QString, QString> &records);
    void insertMusicians(QMap<QString, QString> &records);
    void insertComp(QMap<QString, QString> &records);
    void updateAfterSale();

private:

};
#endif // MAINWINDOW_H
