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

    CustomTextField {
        id: recipeNameInput
        x: 25 * uiCtxt.scale
        y: 130 * uiCtxt.scale
        width: parent.width - (50 * uiCtxt.scale)
        height: 100 * uiCtxt.scale

        placeholderText: "Recipe Name"

        required: true
    }

    CustomTextField {
        id: descriptionInput
        x: 25 * uiCtxt.scale
        y: 250 * uiCtxt.scale

        width: parent.width - (50 * uiCtxt.scale)
        height: 250 * uiCtxt.scale
        topPadding: 10 * uiCtxt.scale
        bottomPadding: 10 * uiCtxt.scale
        leftPadding: 20 * uiCtxt.scale
        rightPadding: 20 * uiCtxt.scale
        backgroundRadius: 40 * uiCtxt.scale

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: TextInput.Wrap

        textPixelSize: recipeNameInput.textPixelSize
        placeholderText: "Enter description..."
    }

    CustomTextField {
        id: miscInput
        x: 25 * uiCtxt.scale
        y: 520 * uiCtxt.scale
        topPadding: 25 * uiCtxt.scale
        bottomPadding: 25 * uiCtxt.scale
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
