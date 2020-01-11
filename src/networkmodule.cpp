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
    QList<QVariant> data;
    QMap<QString,QVariant> item;
    item["order_num"] = id;
    item["count"] = "2";
    item["order_total"] = "1.00";
    item["gold"] = "1.00";
    item["time"] = "2019-11-13";
    item["state"] = "已付款";
    
    QMap<QString,QVariant> msg;
    msg["currentPage"] = 1;
    msg["totalPage"] = 1;
    msg["totalOrder"] = 1;
    data.push_back(msg);
    data.push_back(item);
    
    emit return_order_data(data);
}

void NetworkModule::search_order_from_date(const QDate &first, const QDate &second,
                                           const QString &flag,const int& count,const int& page)
{
    qDebug() << first;
    qDebug() << second;
    qDebug() << flag;
    qDebug() << count;
    qDebug() << page;
    QList<QVariant> data;
    QMap<QString,QVariant> item;
    item["order_num"] = "696386201575696789413";
    item["count"] = "2";
    item["order_total"] = "1.00";
    item["gold"] = "1.00";
    item["time"] = "2019-11-13";
    item["state"] = "已付款";
    
    QMap<QString,QVariant> msg;
    msg["currentPage"] = page;
    msg["totalPage"] = 20;
    msg["totalOrder"] = 20 * count;
    data.push_back(msg);
    for(auto i = 0;i < count;i++){
        data.push_back(item);
        if(item["state"] == "已付款")
            item["state"] = "已退款";
        else  
            item["state"] = "已付款";
    }
    
    emit return_order_data(data);
}

void NetworkModule::search_order_detail(const QString &id,bool isRefund)
{
    qDebug() << id;
    QMap<QString,QVariant> item;
    item["id"] = id;
    item["state"] = "已付款";
    item["isRefund"] = isRefund;
    item["cashier"] = "1000000000001";
    item["category"] = "2";
    item["totalAmount"] = "28.0";
    item["reduceAmount"] = "1.0";
    item["discountedGold"] = "999.0";
    item["amountsPayable"] = "999.0";
    item["actualAmount"] = "1000.9";
    item["giveChange"] = "1.9";
    item["paymentMethod"] = "会员余额";
    item["payTime"] = "2019-11-11";
    item["user"] = "1001";
    item["refund"] = "30.8";
    item["refundTime"] = "2018-11-11";
    item["memberID"] = "`123456789";
    item["integral"] = "1111";
    item["balance"] = "100.00";
    
    QList<QVariant> list;
    QMap<QString,QVariant> map;
    map["name"] = "新疆红枣";
    map["price"] = "22";
    map["dis"] = 0;
    map["count"] = "1";
    map["unit"] = "包";
    list.append(map);
    map.clear();
    map["name"] = "椰青";
    map["price"] = "11.00";
    map["dis"] = "1.00";
    map["count"] = "1";
    map["unit"] = "件";
    list.append(map);
    item["list"] = list;
    emit return_order_detail(item);
}

void NetworkModule::search_member_from_id(const QString &id)
{
    qDebug() << id;
    QList<QVariant> data;
    QMap<QString,QVariant> item;
    item["num"] = id;
    item["integral"] = "2";
    item["balance"] = "1.00";
    item["count"] = "1.00";
    item["registrationTime"] = "2019-11-13";
    item["expireDate"] = "长期";
    item["level"] = "VIP会员";
    item["state"] = "开启";
    item["name"] = "ZM";
    item["remark"] = "一个人";
    
    QMap<QString,QVariant> msg;
    msg["currentPage"] = 1;
    msg["totalPage"] = 1;
    msg["totalOrder"] = 1;
    data.push_back(msg);
    data.push_back(item);
    
    emit return_member_data(data);
}

void NetworkModule::search_member_from_level(const QString &flag, const int &count, const int &page)
{
    qDebug() << flag;
    qDebug() << count;
    qDebug() << page;
    QList<QVariant> data;
    QMap<QString,QVariant> item;
    item["num"] = "12345678900";
    item["integral"] = "2";
    item["balance"] = "1.00";
    item["count"] = "1.00";
    item["registrationTime"] = "2019-11-13";
    item["expireDate"] = "长期";
    item["level"] = "VIP会员";
    item["state"] = "开启";
    item["name"] = "ZM";
    item["remark"] = "一个人";
    
    QMap<QString,QVariant> msg;
    msg["currentPage"] = page;
    msg["totalPage"] = 20;
    msg["totalOrder"] = 20 * count;
    data.push_back(msg);
    for(auto i = 0;i < count;i++){
        data.push_back(item);
        if(item["state"] == "开启")
            item["state"] = "冻结";
        else  
            item["state"] = "开启";
    }
    
    emit return_member_data(data);
}

void NetworkModule::search_member_recording_from_id(bool isRecharge,const QString &id,
                                                    const int &count, const int &page)
{
    qDebug() << isRecharge;
    qDebug() << id;
    qDebug() << count;
    qDebug() << page;
    
    QList<QVariant> data;
    QMap<QString,QVariant> item;
    
    if(isRecharge){
        item["num"] = "696386201575696789413";
        item["account"] = "15626205918";
        item["rechargeAmount"] = "111.00";
        item["rechargeTime"] = "2019-11-145";
        item["state"] = "已付款";
    } else { 
        item["num"] = "696386201575696789413";
        item["count"] = "2";
        item["total"] = "1.00";
        item["actualAmount"] = "1.00";
        item["payTime"] = "2019-11-13";
        item["state"] = "已付款";
    }
    
    QMap<QString,QVariant> msg;
    msg["id"] = id;
    msg["currentPage"] = page;
    msg["totalPage"] = 20;
    msg["totalOrder"] = 20 * count;
    data.push_back(msg);
    for(auto i = 0;i < count;i++){
        item["rechargeAmount"] = QString::number(i);
        item["count"] = QString::number(i);
        data.push_back(item);
    }
    emit return_member_recording(isRecharge,data);
}
