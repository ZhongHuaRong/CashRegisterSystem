#include "globalevent.h"

GlobalEvent::GlobalEvent(QObject *parent) : QObject(parent)
{
    QObject::connect(this,&GlobalEvent::search_order_from_id,
                     &network,&NetworkModule::search_order_from_id);
    QObject::connect(this,&GlobalEvent::search_order_from_date,
                     &network,&NetworkModule::search_order_from_date);
    
    
    QObject::connect(&network,&NetworkModule::return_order_data,
                     this,&GlobalEvent::receive_order_data);
}

void GlobalEvent::receive_order_data(QList<QVariant> data)
{
    emit return_order_data(data);
}
