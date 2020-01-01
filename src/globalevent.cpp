#include "globalevent.h"

GlobalEvent::GlobalEvent(QObject *parent) : QObject(parent)
{
    QObject::connect(this,&GlobalEvent::search_order_from_id,
                     &network,&NetworkModule::search_order_from_id);
    QObject::connect(this,&GlobalEvent::search_order_from_date,
                     &network,&NetworkModule::search_order_from_date);
    QObject::connect(this,&GlobalEvent::search_order_detail,
                     &network,&NetworkModule::search_order_detail);
    
    
    QObject::connect(&network,&NetworkModule::return_order_data,
                     this,&GlobalEvent::receive_order_data);
    QObject::connect(&network,&NetworkModule::return_order_detail,
                     this,&GlobalEvent::receive_order_detail);
}

void GlobalEvent::receive_order_detail(const QVariant &data)
{
    emit return_order_detail(data);
}

void GlobalEvent::receive_order_data(const QList<QVariant> &data)
{
    emit return_order_data(data);
}
