#ifndef IMAGEITEM_H
#define IMAGEITEM_H

#include <QQuickItem>
#include <QQuickPaintedItem>
#include <QDir>
#include <QImage>

class ImageItem : public QQuickPaintedItem
{
    Q_OBJECT
public:
    Q_PROPERTY(QString source READ getSource WRITE setSource NOTIFY sourceChanged)
public:
    ImageItem();
    
    QString getSource() const;
    void setSource(const QString &value);
    
protected:
    virtual void paint(QPainter *event);
signals:
    void sourceChanged();
public slots:
private:
    QString source;
    QImage image;
};

#endif // IMAGEITEM_H
