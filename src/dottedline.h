#ifndef DOTTEDLINE_H
#define DOTTEDLINE_H

#include <QQuickPaintedItem>

class DottedLine : public QQuickPaintedItem
{
    Q_OBJECT
public:
    enum Direction{
        Horizontal,
        Vertical
    };
    Q_ENUMS(Direction)
    
    Q_PROPERTY(Direction direction READ getDirection WRITE setDirection NOTIFY directionChanged)
public:
    DottedLine();
    
    Direction getDirection() const;
    void setDirection(const Direction &value);
    
protected:
    virtual void paint(QPainter *event);
signals:
    void directionChanged();
public slots:
private:
    Direction direction;
};

#endif // DOTTEDLINE_H
