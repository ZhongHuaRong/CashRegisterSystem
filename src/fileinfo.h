#ifndef FILEINFO_H
#define FILEINFO_H

#include <QObject>
#include <QThread>
#include <QMap>
#include <QList>
#include <QVariant>

class FileInfo : public QObject
{
    Q_OBJECT
public:
    explicit FileInfo(QObject *parent = nullptr);
    
    ~FileInfo();
signals:
    void return_image_path_list(const QVariantList& list);
public slots:
    void find_image(const QString& path);
private:
    QThread * thread;
};

#endif // FILEINFO_H
