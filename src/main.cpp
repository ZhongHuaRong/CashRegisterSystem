#include <QDir>
#include <QSettings>
#include <QDebug>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "globalevent.h"
#include "cxxcontainer.h"

#ifdef RELEASE 
#include <QDateTime>
void customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString & str)
{
	QString txtMessage;
	QString &&dateTime = QDateTime::currentDateTime().toString(QStringLiteral("yyyy-MM-dd HH:mm:ss"));

	switch (type)
	{
	case QtDebugMsg:    //调试信息提示
		txtMessage = QString("Debug<%1>: %2\n").arg(dateTime).arg(str);
		break;

	case QtWarningMsg:    //一般的warning提示
		txtMessage = QString("Warning<%1>: %2\n").arg(dateTime).arg(str);
		break;

	case QtCriticalMsg:    //严重错误提示
		txtMessage = QString("Critical<%1>: %2\n").arg(dateTime).arg(str);
		break;

	case QtFatalMsg:    //致命错误提示
		txtMessage = QString("Fatal<%1>: %2\n").arg(dateTime).arg(str);
		abort();
	}

	//保存输出相关信息到指定文件
	QFile outputFile(QCoreApplication::applicationDirPath() + "./Talkpal.log");
	outputFile.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text);
	QTextStream textStream(&outputFile);
	textStream << txtMessage << endl;
}
#endif

int main(int argc, char *argv[])
{
#ifdef RELEASE 
	qInstallMessageHandler(customMessageHandler);
#endif
    
//    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    
    qApp->setApplicationName("CashRegisterSystem");
    qApp->setOrganizationName("ZM");
    qApp->setApplicationVersion("0.1");
    
    QSettings::setDefaultFormat(QSettings::IniFormat);
    
    //注册，使C++类在qml中使用
    qRegisterMetaType<QVector<QMap<QString,QString>>>("QVector<QMap<QString,QString>>");
    qmlRegisterType<GlobalEvent>("an.qt.GlobalEvent", 1, 0, "GlobalEvent");
    qmlRegisterType<CXXContainer>("an.qt.CXXContainer", 1, 0, "CXXContainer");
    
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/ui/main.qml")));
    if (engine.rootObjects().empty())
        return -1;
    return app.exec();
}
