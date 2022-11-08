import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia

ApplicationWindow {
    id: home_page
    width: uiCtxt.devWidth//1080 * uiCtxt.scale
    height: uiCtxt.devHeight//2400 * uiCtxt.scale
    color: "#503929"
    visible: true
    visibility: "FullScreen"
    title: qsTr("Home Page")

    property var imageCap: captureSession.imageCapture.preview


    onImageCapChanged: {
        console.log(imageCap)

        //console.log("Printing path ----------------------------------------------------------------")
        //console.log(imageCap)
        //console.log("------------------------------------------------------------------------------")

        //dbActions.sendImage(imageCap);
    }

    // TODO

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: title_txt.top

        text: dbActions.fileLoc //TODO
    }

    CaptureSession {
        id: captureSession
        videoOutput: output
        camera: Camera {}
        imageCapture: ImageCapture {
            onImageSaved: function (id, path) {
                console.log("Printing path ----------------------------------------------------------------")
                console.log(path)
                console.log("------------------------------------------------------------------------------")

                // Send image to server
                dbActions.sendImage(path);
            }
        }
    }

    VideoOutput {
        id: output
        anchors.fill: parent
    }

    Button {
        id: shotButton

        width: uiCtxt.devWidth / 5 //parent.buttonWidth
        height: uiCtxt.devHeight / 5 //parent.buttonHeight

        text: qsTr("Take Photo")
        onClicked: {
            //captureSession.camera.start() // TODO This is what was missing to start the camera
            captureSession.imageCapture.captureToFile("/storage/emulated/0/Android/data/org.qtproject.example.recipe_finder_app/files/Pictures/newImg")
            //captureSession.camera.stop()
        }
    }

    /*Image {
        id: photoPreview
        source: new QImage(captureSession.imageCapture.preview)
    }*/

    // TODO


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
                onTapped: captureSession.camera.start() // TODO This is what was missing to start the camera //dbActions.getGenData("path")//changePage("Account.qml")
                onLongPressed: changePage("Account.qml")
            }
        }
    }


    /* TODO
    CaptureSession {
        imageCapture: ImageCapture {
            id: imageCapture
        }
        camera: Camera {
            id: camera
        }
    }*/

    /* TODO
    VideoOutput {
        id: videoOutput
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            onClicked: imageCapture.capture()
        }
    }*/

    /* TODO
    Image {
        id: photoPreview
        x: 70 * uiCtxt.scale
        y: 70 * uiCtxt.scale
        source: imageCapture.preview
    }*/

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
