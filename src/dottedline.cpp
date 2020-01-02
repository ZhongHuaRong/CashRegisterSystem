#include "dottedline.h"
#include <QPainter>

DottedLine::DottedLine()
{
    direction = Direction::Vertical;
    this->setHeight(1);
}

void DottedLine::paint(QPainter *event)
{
    event->setPen(QPen(Qt::DashDotDotLine));
    if(direction == Direction::Vertical){
        event->drawLine(0,0,this->width(),0);
    } else {
        event->drawLine(0,0,0,this->height());
    }
}

DottedLine::Direction DottedLine::getDirection() const
{
    return direction;
}

void DottedLine::setDirection(const Direction &value)
{
    direction = value;
    emit directionChanged();
}
