#ifndef NETWORKMODULE_H
#define NETWORKMODULE_H

#include <QObject>
#include <QThread>
#include <QMap>
#include <QList>
#include <QVariant>

class NetworkModule : public QObject
{
    Q_OBJECT
public:
    explicit NetworkModule(QObject *parent = nullptr);
    
    ~NetworkModule();
signals:
    void return_order_data(QList<QVariant> data);
public slots:
    void search_order_from_id(const QString& id);
    void search_order_from_date(const QDate& first,const QDate& second,const QString& flag,const int& count); 
private:
    QThread * thread;
};

#endif // NETWORKMODULE_H
