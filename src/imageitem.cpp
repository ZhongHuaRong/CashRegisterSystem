#include "imageitem.h"
#include <QPainter>
#include <QImage>
#include <QPixmap>

ImageItem::ImageItem()
{
    
}

QString ImageItem::getSource() const
{
    return source;
}

void ImageItem::setSource(const QString &value)
{
    if(source == value)
        return;
    source = value;
    image.load(source);
    emit sourceChanged();
}

void ImageItem::paint(QPainter *event)
{
    event->drawImage(QRectF(0,0,this->width(),this->height()),
                     image,
                     image.rect());
}
