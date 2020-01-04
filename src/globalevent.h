#ifndef GLOBALEVENT_H
#define GLOBALEVENT_H

#include <QObject>
#include <QVariant>
#include <QMap>
#include <QList>
#include "networkmodule.h"
/**
 * @brief The GlobalEvent class
 * 全局事件处理
 * 通过单例模式，从UI获取信号，然后发送到相应的类中操作，获取到结果后发送信号到UI处理
 * 属于中间层，连接C++类和UI的中枢
 * 该类所有权在UI线程，C++类另开线程处理事务
 * 该类接口在发送完信号后就会返回
 */
class GlobalEvent : public QObject
{
    Q_OBJECT
public:
    explicit GlobalEvent(QObject *parent = nullptr);
    
signals:
    void search_order_from_id(const QString& id);
    void search_order_from_date(const QDate& first,const QDate& second,
                                const QString& flag,const int& count,const int& page);
    void search_order_detail(const QString& id,bool isRefund);
    
    void search_member_from_level(const QString& flag,const int& count,const int& page);
    void search_member_from_id(const QString& id);
    
    void return_order_data(const QList<QVariant>& data);
    void return_order_detail(const QVariant& data);
    
    void return_member_data(const QList<QVariant>& data);
public slots:
    void receive_order_data(const QList<QVariant>& data);
    void receive_order_detail(const QVariant& data);
    
    void receive_member_data(const QList<QVariant>& data);
private:
    NetworkModule network;
};

#endif // GLOBALEVENT_H
