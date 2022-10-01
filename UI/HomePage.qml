import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: home_page
    width: 1080 * uiCtxt.scale
    height: 2400 * uiCtxt.scale
    color: "#503929"
    visible: true
    visibility: "FullScreen"
    title: qsTr("Home Page")


    function changePage(pageName) {
        // Create new page component and object corresponding to the passed pageName
        var newPageComponent = Qt.createComponent(pageName)
        var newPageWindow = newPageComponent.createObject()

        // Display new window
        newPageWindow.showFullScreen()
        // Close current window (HomePage)
        home_page.close()
    }


    Text {
        id: welcome_txt
        x: 308 * uiCtxt.scale
        y: 387 * uiCtxt.scale
        width: 463 * uiCtxt.scale
        height: 150 * uiCtxt.scale
        color: "#ffffff"
        font.weight: Font.ExtraBold
        text: qsTr("Welcome to")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 122
    }

    Text {
        id: title_txt
        x: 85 * uiCtxt.scale
        y: 498 * uiCtxt.scale
        width: 910 * uiCtxt.scale
        height: 200 * uiCtxt.scale
        color: "#ffffff"
        font.weight: Font.ExtraBold
        text: qsTr("Recipe Finder")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 122
    }

    Rectangle {
        id: search_recipes_rect
        x: 55 * uiCtxt.scale
        y: 900 * uiCtxt.scale
        width: 970 * uiCtxt.scale
        height: 320 * uiCtxt.scale
        color: "#443322"
        radius: 125 * uiCtxt.scale
        border.color: "#221100"
        border.width: 10 * uiCtxt.scale

        Text {
            id: search_recipes_txt

            anchors.centerIn: parent
            width: 726 * uiCtxt.scale
            height: 160 * uiCtxt.scale
            color: "#ffffff"
            font.weight: Font.ExtraBold
            text: qsTr("Search Recipes")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }

        TapHandler {
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: changePage("SearchRecipes.qml")
            onLongPressed: changePage("SearchRecipes.qml")
        }
    }

    Rectangle {
        id: add_recipes_rect
        x: 55 * uiCtxt.scale
        y: 1350 * uiCtxt.scale
        width: 970 * uiCtxt.scale
        height: 320 * uiCtxt.scale
        color: "#443322"
        radius: 125 * uiCtxt.scale
        border.color: "#221100"
        border.width: 10 * uiCtxt.scale

        Text {
            id: add_recipes_txt
            anchors.centerIn: parent
            width: 588 * uiCtxt.scale
            height: 160 * uiCtxt.scale
            color: "#ffffff"
            font.weight: Font.ExtraBold
            text: qsTr("Add Recipes")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }

        TapHandler {
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: changePage("AddRecipe.qml")
            onLongPressed: changePage("AddRecipe.qml")
        }
    }

    Rectangle {
        id: account_rect
        x: 55 * uiCtxt.scale
        y: 1800 * uiCtxt.scale
        width: 970 * uiCtxt.scale
        height: 320 * uiCtxt.scale
        color: "#443322"
        radius: 125 * uiCtxt.scale
        border.color: "#221100"
        border.width: 10 * uiCtxt.scale

        Text {
            id: account_txt
            anchors.centerIn: parent
            width: 398 * uiCtxt.scale
            height: 160 * uiCtxt.scale
            color: "#ffffff"
            font.weight: Font.ExtraBold
            text: qsTr("Account")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }

        TapHandler {
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: changePage("Account.qml")
            onLongPressed: changePage("Account.qml")
        }
    }

    Image {
        id: dashed_lines
        x: 30 * uiCtxt.scale
        y: 30 * uiCtxt.scale
        source: "Images/Home_Page_Dashed_Lines.png"
        width: 1020 * uiCtxt.scale
        height: 2340 * uiCtxt.scale
        sourceSize.width: 1020
        sourceSize.height: 2340
        fillMode: Image.PreserveAspectFit
    }
}
