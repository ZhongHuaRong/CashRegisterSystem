#include "fileinfo.h"
#include <QFileInfo>
#include <QFileInfoList>
#include <QDir>
#include <QDebug>

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
    
    QDir dir(path);
    QStringList filters;
    filters << "*.jpg" << "*.png" << "*.gif";
    dir.setNameFilters(filters);
    
    for(auto i : dir.entryList()){
        list.push_back(dir.absolutePath() + "/" + i);
    }
    emit return_image_path_list(list);
}
