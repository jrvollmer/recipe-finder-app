import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: account_page
    width: uiCtxt.devWidth//1080 * uiCtxt.scale
    height: uiCtxt.devHeight//2400 * uiCtxt.scale
    color: "#EFDFCF"
    visible: true
    visibility: "FullScreen"
    title: qsTr("Account Page")

    function backToHomePage() {
        // Create HomePage component and object
        var homePageComponent = Qt.createComponent("HomePage.qml")
        var homePageWindow = homePageComponent.createObject()

        // Display HomePage window
        homePageWindow.showFullScreen()
        // Close current window (Account)
        account_page.close()
    }

    Image {
        id: home_icon
        x: 35 * uiCtxt.scale
        y: 20 * uiCtxt.scale
        source: "Images/Home_Icon.png"
        width: 100 * uiCtxt.scale //389
        height: 96 * uiCtxt.scale //891
        sourceSize.width: 100
        sourceSize.height: 96
        fillMode: Image.PreserveAspectFit

        TapHandler { // TODO
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: backToHomePage()
            onLongPressed: backToHomePage()
        }
    }

    /* TODO
    Image {
        anchors.centerIn: parent
        source: "URL TO FETCH THE IMAGE FROM THE VPS (http://domain:port/route)"
        width: 0.5 * uiCtxt.scale * 1112
        height: 0.5 * uiCtxt.scale * 545
        sourceSize.width: 1112
        sourceSize.height: 545

    }*/

    /*Rectangle { // TODO
        anchors.centerIn: parent
        width: 970 * uiCtxt.scale
        height: 320 * uiCtxt.scale
        color: "#FFFFFF"

        Text { // TODO
            id: account_page_txt
            anchors.centerIn: parent
            width: 588 * uiCtxt.scale
            height: 160 * uiCtxt.scale
            color: "#000000"
            font.weight: Font.ExtraBold
            text: qsTr("Account Page")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }

        /*TapHandler { // TODO
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: dbActions.addData("Name1", 2) // TODO Inserts random data into database
            onLongPressed: dbActions.addData("Name1", 2) // TODO Inserts random data into database
        }*/
    //}
}
