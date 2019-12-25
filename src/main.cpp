#include <QDir>
#include <QSettings>
#include <QDebug>
#include <QQuickView>
#include <QQmlEngine>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

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
//    qRegisterMetaType<QList<QList<QVariant>>>("QList<QList<QVariant>>");
//    qmlRegisterType<CodeArea>("an.qt.CodeArea", 1, 0, "CodeArea");
    
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/ui/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    
    return app.exec();
}
