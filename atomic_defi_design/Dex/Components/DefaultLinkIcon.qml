import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qaterial 1.0 as Qaterial
import "../Constants" as Constants
import App 1.0


Qaterial.Icon
{
    property int xPos: 0
    property int iconSize: 14
    property string linkURL: ""

    Layout.alignment: Qt.AlignVCenter

    x: xPos
    size: iconSize
    visible: linkURL !== ""
    icon: Qaterial.Icons.linkVariant
    color: linkArea.containsMouse ? Style.colorText2 : DexTheme.foregroundColor
    
    DexMouseArea
    {
        id: linkArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: Qt.openUrlExternally(linkURL)
    }
}
