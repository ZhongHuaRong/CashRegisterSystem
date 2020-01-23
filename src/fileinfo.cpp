#include "fileinfo.h"

FileInfo::FileInfo(QObject *parent) : QObject(parent)
{
    thread = new QThread();
    this->moveToThread(thread);
    thread->start();
}

FileInfo::~FileInfo()
{
    thread->exit();
    thread->wait();
    delete thread;
}

void FileInfo::find_image(const QString &path)
{
    QVariantList list;
    list.push_back(path);
    
    emit return_image_path_list(list);
}
