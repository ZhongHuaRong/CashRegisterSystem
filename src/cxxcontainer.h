#ifndef CXXCONTAINER_H
#define CXXCONTAINER_H

#include <QObject>
#include <QVariant>

class CXXContainer : public QObject
{
    Q_OBJECT
public:
    explicit CXXContainer(QObject *parent = nullptr);
    
    Q_INVOKABLE int size(const QVariant& container) const noexcept;
};

#endif // CXXCONTAINER_H
