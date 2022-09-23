import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: add_recipe_page
    width: 1080 * uiCtxt.scale
    height: 2400 * uiCtxt.scale
    color: "#EFDFCF"
    visible: true
    visibility: "FullScreen"
    title: qsTr("Add Recipe Page")

    function backToHomePage() {
        // Create HomePage component and object
        var homePageComponent = Qt.createComponent("HomePage.qml")
        var homePageWindow = homePageComponent.createObject()

        // Display HomePage window
        homePageWindow.showFullScreen()
        // Close current window (AddRecipe)
        add_recipe_page.close()
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

    Rectangle { // TODO
        anchors.centerIn: parent
        width: 970 * uiCtxt.scale
        height: 320 * uiCtxt.scale
        color: "#FFFFFF"

        Text { // TODO
            id: insert_data_txt
            anchors.centerIn: parent
            width: 588 * uiCtxt.scale
            height: 160 * uiCtxt.scale
            color: "#000000"
            font.weight: Font.ExtraBold
            text: qsTr("Insert Data Into Database")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }

        TapHandler { // TODO
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: dbActions.addData("Name1", 2) // TODO Inserts random data into database
            onLongPressed: dbActions.addData("Name1", 2) // TODO Inserts random data into database
        }
    }
}
