#include "cxxcontainer.h"
#include <QDebug>

CXXContainer::CXXContainer(QObject *parent) : QObject(parent)
{
    
}

int CXXContainer::size(const QVariant &container) const noexcept
{
    return container.toList().size();
}
