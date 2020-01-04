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
    void return_order_data(const QList<QVariant> &data);
    void return_order_detail(const QVariant &data);
    
    void return_member_data(const QList<QVariant> &data);
public slots:
    void search_order_from_id(const QString& id);
    void search_order_from_date(const QDate& first,const QDate& second,
                                const QString& flag,const int& count,const int& page); 
    void search_order_detail(const QString& id,bool isRefund);
    
    
    void search_member_from_id(const QString& id);
    void search_member_from_level(const QString& flag,const int& count,const int& page); 
private:
    QThread * thread;
};

#endif // NETWORKMODULE_H
