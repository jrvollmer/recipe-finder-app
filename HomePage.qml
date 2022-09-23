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

    function openAddRecipes() {
        // Create AddRecipe component and object
        var addRecipeComponent = Qt.createComponent("AddRecipe.qml")
        var addRecipeWindow = addRecipeComponent.createObject()

        // Display AddRecipe window
        addRecipeWindow.showFullScreen()
        // Close current window (HomePage)
        home_page.close()
    }


    Text {
        id: welcome_txt
        x: 308 * uiCtxt.scale
        y: 462 * uiCtxt.scale
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
        y: 573 * uiCtxt.scale
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
        y: 1000 * uiCtxt.scale
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

        TapHandler { // TODO
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: console.log("Tapped Search Recipes")
            onLongPressed: console.log("Long Pressed Search Recipes")
        }
    }

    Rectangle {
        id: add_recipes_rect
        x: 55 * uiCtxt.scale
        y: 1500 * uiCtxt.scale
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

        TapHandler { // TODO
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: openAddRecipes()// dbActions.addData("Name1", 2)//console.log("Tapped Add Recipes")
            onLongPressed: console.log("Long Pressed Add Recipes")
        }
    }

    Image {
        id: dashed_lines
        x: 30 * uiCtxt.scale
        y: 30 * uiCtxt.scale
        source: "Images/Home_Page_Dashed_Lines.png"
        width: 1020 * uiCtxt.scale //389
        height: 2340 * uiCtxt.scale //891
        sourceSize.width: 1020
        sourceSize.height: 2340
        fillMode: Image.PreserveAspectFit
    }
}
