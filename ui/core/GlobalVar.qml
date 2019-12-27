
pragma Singleton
import QtQuick 2.12
import QtQml 2.12

QtObject {
    id:global_var
    property var $settings: GlobalSettings{} 
    property var $locale: Qt.locale()
}
