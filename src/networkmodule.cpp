#include "networkmodule.h"
#include <QDebug>

NetworkModule::NetworkModule(QObject *parent) : QObject(parent)
{
    thread = new QThread();
    this->moveToThread(thread);
    thread->start();
}

NetworkModule::~NetworkModule()
{
    thread->exit();
    thread->wait();
    delete thread;
}

void NetworkModule::search_order_from_id(const QString &id)
{
    qDebug() << id;
}

void NetworkModule::search_order_from_date(const QDate &first, const QDate &second,
                                           const QString &flag,const int& count)
{
    qDebug() << first;
    qDebug() << second;
    qDebug() << flag;
    qDebug() << count;
    QList<QVariant> data;
    QMap<QString,QVariant> item;
    item["订单号"] = "696386201575696789413";
    item["商品数量"] = "2";
    item["订单总额"] = "1.00";
    item["实收金额"] = "1.00";
    item["支付时间"] = "2019-11-13";
    item["状态"] = "已付款";
    
    data.push_back(1200);
    for(auto i = 0;i < count;i++){
        data.push_back(QVariant(item));
    }
    
    emit return_order_data(data);
}
