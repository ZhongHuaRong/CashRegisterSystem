#include "globalevent.h"

GlobalEvent::GlobalEvent(QObject *parent) : QObject(parent)
{
    QObject::connect(this,&GlobalEvent::search_order_from_id,
                     &network,&NetworkModule::search_order_from_id);
    QObject::connect(this,&GlobalEvent::search_order_from_date,
                     &network,&NetworkModule::search_order_from_date);
    QObject::connect(this,&GlobalEvent::search_order_detail,
                     &network,&NetworkModule::search_order_detail);
    
    QObject::connect(this,&GlobalEvent::search_member_from_level,
                     &network,&NetworkModule::search_member_from_level);
    QObject::connect(this,&GlobalEvent::search_member_from_id,
                     &network,&NetworkModule::search_member_from_id);
    QObject::connect(this,&GlobalEvent::search_member_recording_from_id,
                     &network,&NetworkModule::search_member_recording_from_id);
    
    
    QObject::connect(&network,&NetworkModule::return_order_data,
                     this,&GlobalEvent::receive_order_data);
    QObject::connect(&network,&NetworkModule::return_order_detail,
                     this,&GlobalEvent::receive_order_detail);
    
    QObject::connect(&network,&NetworkModule::return_member_data,
                     this,&GlobalEvent::receive_member_data);
    QObject::connect(&network,&NetworkModule::return_member_recording,
                     this,&GlobalEvent::receive_member_recording);
    
    QObject::connect(this,&GlobalEvent::find_image,
                     &fileinfo,&FileInfo::find_image);
    QObject::connect(&fileinfo,&FileInfo::return_image_path_list,
                     this,&GlobalEvent::receive_image_path_list);
}

void GlobalEvent::receive_order_detail(const QVariant &data)
{
    emit return_order_detail(data);
}

void GlobalEvent::receive_member_data(const QList<QVariant> &data)
{
    emit return_member_data(data);
}

void GlobalEvent::receive_member_recording(bool isRecharge, const QList<QVariant> &data)
{
    emit return_member_recording(isRecharge,data);
}

void GlobalEvent::receive_image_path_list(const QVariantList &pathlist)
{
    emit return_image_path_list(pathlist);
}

void GlobalEvent::receive_order_data(const QList<QVariant> &data)
{
    emit return_order_data(data);
}
