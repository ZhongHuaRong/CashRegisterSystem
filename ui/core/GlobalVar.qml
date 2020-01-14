
pragma Singleton
import QtQuick 2.12
import QtQml 2.12
import an.qt.GlobalEvent 1.0

QtObject {
    id:global_var
    property var $settings: GlobalSettings{} 
    property var $locale: Qt.locale()
    property var $event : GlobalEvent{}
    property var $accountID: "1001"
    property var $electronicScaleState: "未连接"
}
