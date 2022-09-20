import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.12

Window {
    id: root
    width: 1080 * uiCtxt.scale
    height: 2400 * uiCtxt.scale
    visible: true
    visibility: "FullScreen"
    color: "#503929"
    title: qsTr("Home Page")

    HomePage {

    }
}
