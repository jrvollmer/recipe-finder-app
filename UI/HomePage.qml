import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: home_page
    width: uiCtxt.devWidth//1080 * uiCtxt.scale
    height: uiCtxt.devHeight//2400 * uiCtxt.scale
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: title_txt.top
        //x: 0// 308 * uiCtxt.scale
        //y: parent.height / 6 //387 * uiCtxt.scale
        width: parent.width * 23 / 54 //463 * uiCtxt.scale
        height: parent.height / 12//150 * uiCtxt.scale
        color: "#ffffff"
        font.weight: Font.ExtraBold
        text: qsTr("Welcome to")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 122
    }

    Text {
        id: title_txt
        anchors.horizontalCenter: parent.horizontalCenter
        //x: 0//85 * uiCtxt.scale
        y: parent.height * 5 / 24//498 * uiCtxt.scale
        width: parent.width * 5 / 6//910 * uiCtxt.scale
        height: parent.height / 8 //200 * uiCtxt.scale
        color: "#ffffff"
        font.weight: Font.ExtraBold
        text: qsTr("Recipe Finder")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 122
    }

    ColumnLayout {
        id: page_buttons_layout
        x: 55 * uiCtxt.scale
        y: parent.height * 3 / 8 // TODO 900 * uiCtxt.scale

        width: parent.width - 110 * uiCtxt.scale
        height: parent.height * 61 / 120
        spacing: parent.height * 13 / 240

        Rectangle {
            id: search_recipes_rect
            //x: 55 * uiCtxt.scale
            //y: parent.height * 3 / 8 // TODO 900 * uiCtxt.scale
            //width: parent.width - 110 * uiCtxt.scale//970 * uiCtxt.scale
            //height: parent.height * 2 / 15 // TODO 320 * uiCtxt.scale
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#443322"
            radius: height / 2.56 //125 * uiCtxt.scale
            border.color: "#221100"
            border.width: 10 * uiCtxt.scale

            Text {
                id: search_recipes_txt

                anchors.centerIn: parent
                width: parent.width // 726 * uiCtxt.scale
                height: parent.height * 3 / 8 //160 * uiCtxt.scale
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
            //x: 55 * uiCtxt.scale
            //y: parent.height * 9 / 16 // TODO 1350 * uiCtxt.scale
            //width: parent.width - 110 * uiCtxt.scale// 970 * uiCtxt.scale
            //height: parent.height * 3 / 8 // TODO  320 * uiCtxt.scale
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#443322"
            radius: height / 2.56 //125 * uiCtxt.scale
            border.color: "#221100"
            border.width: 10 * uiCtxt.scale

            Text {
                id: add_recipes_txt
                anchors.centerIn: parent
                width: parent.width //588 * uiCtxt.scale
                height: parent.height * 3 / 8 // TODO 160 * uiCtxt.scale
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
            //x: 55 * uiCtxt.scale
            //y: 1800 * uiCtxt.scale
            //width: parent.width - 110 * uiCtxt.scale //970 * uiCtxt.scale
            //height: 320 * uiCtxt.scale
            Layout.row: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#443322"
            radius: height / 2.56 //125 * uiCtxt.scale
            border.color: "#221100"
            border.width: 10 * uiCtxt.scale

            Text {
                id: account_txt
                anchors.centerIn: parent
                width: parent.width //398 * uiCtxt.scale
                height: parent.height * 3 / 8 //160 * uiCtxt.scale
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
                onTapped: dbActions.getGenData("path")//changePage("Account.qml")
                onLongPressed: changePage("Account.qml")
            }
        }
    }

    Image {
        id: dashed_lines
        x: 30 * uiCtxt.scale
        y: 30 * uiCtxt.scale
        source: "Images/Home_Page_Dashed_Lines.png"
        width: parent.width - 60 * uiCtxt.scale
        height: parent.height - 60 * uiCtxt.scale
        sourceSize.width: 1020
        sourceSize.height: 2340
        //fillMode: Image.PreserveAspectFit // Removed to allow shrinking for different geometries
    }
}
