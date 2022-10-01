import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: search_recipes_page
    width: uiCtxt.devWidth//1080 * uiCtxt.scale
    height: uiCtxt.devHeight//2400 * uiCtxt.scale
    color: "#EFDFCF"
    visible: true
    visibility: "FullScreen"
    title: qsTr("Search Recipes Page")

    function backToHomePage() {
        // Create HomePage component and object
        var homePageComponent = Qt.createComponent("HomePage.qml")
        var homePageWindow = homePageComponent.createObject()

        // Display HomePage window
        homePageWindow.showFullScreen()
        // Close current window (SearchRecipes)
        search_recipes_page.close()
    }

    Rectangle {
        id: tab_bar
        x: 0
        y: 0
        width: 1080 * uiCtxt.scale
        height: 135 * uiCtxt.scale
        color: "#BB8F5F"

        Image {
            id: home_icon
            x: 35 * uiCtxt.scale
            y: 20 * uiCtxt.scale
            source: "Images/Home_Icon.png"
            width: 100 * uiCtxt.scale
            height: 96 * uiCtxt.scale
            sourceSize.width: 100
            sourceSize.height: 96
            fillMode: Image.PreserveAspectFit

            TapHandler { // TODO
                acceptedDevices: PointerDevice.TouchScreen
                onTapped: backToHomePage()
                onLongPressed: backToHomePage()
            }
        }
    }
}
