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

    /*Image {
        id: required_icon
        x: 7 * uiCtxt.scale
        y: 112 * uiCtxt.scale
        source: "Images/Required_Symbol.png"
        width: 35 * uiCtxt.scale
        height: 35 * uiCtxt.scale
        sourceSize.width: 35
        sourceSize.height: 35
        fillMode: Image.PreserveAspectFit

        TapHandler { // TODO
            acceptedDevices: PointerDevice.TouchScreen
            onTapped: backToHomePage()
            onLongPressed: backToHomePage()
        }
    }*/

/*
    TextField {
        x: 25 * uiCtxt.scale
        y: 130 * uiCtxt.scale
        style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                radius: 2
                implicitWidth: 1000 * uiCtxt.scale
                implicitHeight: 100 * uiCtxt.scale
                border.color: "#333"
                border.width: 1
            }
        }
    }*/



    CustomTextField {
        id: recipeNameInput
        x: 25 * uiCtxt.scale
        y: 130 * uiCtxt.scale
        placeholderText: "Recipe Name"
        //placeholderTextColor: "#CCCCCC" // TODO
        width: 1030 * uiCtxt.scale
        height: 100 * uiCtxt.scale

        required: true
    }

    CustomTextField {
        id: descriptionInput
        x: 25 * uiCtxt.scale
        y: 250 * uiCtxt.scale
        placeholderText: "Enter description..."
        //placeholderTextColor: "#CCCCCC" // TODO
        width: 1030 * uiCtxt.scale
        height: 250 * uiCtxt.scale
        topPadding: 10 * uiCtxt.scale
        bottomPadding: 10 * uiCtxt.scale
        leftPadding: 20 * uiCtxt.scale
        rightPadding: 20 * uiCtxt.scale
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: TextInput.Wrap

        background: Rectangle {
            //x: 25 * uiCtxt.scale
            //y: 130 * uiCtxt.scale
            //width: parent.width
            //height: parent.height
            radius: 40 * uiCtxt.scale
            border.color: "#443311"
            border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
        }
    }

    CustomTextField {
        id: miscInput
        x: 25 * uiCtxt.scale
        y: 520 * uiCtxt.scale
        placeholderText: "Enter text..."
        //placeholderTextColor: "#CCCCCC" // TODO
    }
    /*TextField {
        color: "#000000"
        x: 25 * uiCtxt.scale
        y: 130 * uiCtxt.scale
        id: recipeNameInput
        font.pixelSize: 20; font.bold: true
        placeholderText: "Recipe name"
        //placeholderTextColor: "#CCCCCC"
        width: 980 * uiCtxt.scale
        height: 100 * uiCtxt.scale
        focus: false
        leftPadding: 50 * uiCtxt.scale
        bottomPadding: 0
        topPadding: 0
        selectByMouse: true

        onEditingFinished: {
            // Move the cursor (and consequently the displayed text) back to the beginning
            // of the input and remove focus when the user presses the Enter/Done key
            recipeNameInput.cursorPosition = 0;
            recipeNameInput.focus = false;
            console.log(recipeNameInput.text);//getText(0,1));
        }

        background: Rectangle {
            //x: 25 * uiCtxt.scale
            //y: 130 * uiCtxt.scale
            width: 1030 * uiCtxt.scale
            height: parent.height
            radius: 50 * uiCtxt.scale
            border.color: "#443311"
            border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)

        }
    }*/

/*
    TextArea {
        x: 25 * uiCtxt.scale
        y: 130 * uiCtxt.scale
        width: 1030 * uiCtxt.scale
        height: 100 * uiCtxt.scale
        //contentHeight: 90 * uiCtxt.scale
        fontSizeMode: Text.Fit
        color: "#000000"
        placeholderText: "Recipe Name"
        placeholderTextColor: "#CCCCCC"
        //clip: false
        leftPadding: 50 * uiCtxt.scale

        background: Rectangle {
            width: parent.width// 1000 * uiCtxt.scale
            height: parent.height //90 * uiCtxt.scale
            anchors.bottom: parent.bottom
            color: "#FFFFFF"
            radius: 50 * uiCtxt.scale
        }
    }*/

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
