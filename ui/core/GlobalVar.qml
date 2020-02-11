
pragma Singleton
import QtQuick 2.12
import QtQml 2.12
import an.qt.GlobalEvent 1.0

QtObject {
    id:global_var
    property var $settings: GlobalSettings{} 
    property var $locale: Qt.locale()
    property var $event : GlobalEvent{}
    property string $accountID: "1001"
    property string $electronicScaleState: "未连接"
    property var $adImageList: []
    property real $curImageIndex: 0
    property string $shopname: "也有果"
    property var $commodityList: []
    property real $netWeight: 0.00
    property real $totalGold: 20.00
    property real $discount: 10.00
    property real $actualPayment: 0.00
}
