import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: add_recipe_page
    width: uiCtxt.devWidth//1080 * uiCtxt.scale
    height: uiCtxt.devHeight//2400 * uiCtxt.scale
    color: "#EFDFCF"
    visible: true
    visibility: "FullScreen"
    title: qsTr("Add Recipe Page")

    property int typicalInputHeight: uiCtxt.devHeight / 24

    function backToHomePage() {
        // Create HomePage component and object
        var homePageComponent = Qt.createComponent("HomePage.qml")
        var homePageWindow = homePageComponent.createObject()

        // Display HomePage window
        homePageWindow.showFullScreen()
        // Close current window (AddRecipe)
        add_recipe_page.close()
    }

    function addToDatabase() {
        console.log(add_recipe_page.typicalInputHeight);
        if(recipe_name_input.text != "") {
            console.log("----------------------------------------------------------------------------- INSERTED " + recipe_name_input.text + " INTO DATABASE --------------------------------------------------------------------"); // TODO Remove
            dbActions.addData(recipe_name_input.text, 2);
        }
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

    ColumnLayout {
        id: input_layout
        x: 25 * uiCtxt.scale
        y: 130 * uiCtxt.scale
        width: parent.width - (50 * uiCtxt.scale)
        //height: 100 * uiCtxt.scale
        height: parent.height - 210 * uiCtxt.scale //* 61 / 120
        spacing: parent.height / 120
        //rows: 44 // 44 rows; each item will take up at least two

        CustomTextField {
            id: recipe_name_input
            //x: 25 * uiCtxt.scale
            //y: 130 * uiCtxt.scale
            Layout.row: 0
            Layout.fillWidth: true
            //Layout.minimumWidth: input_layout.width
            height: add_recipe_page.typicalInputHeight
            Layout.maximumHeight: add_recipe_page.typicalInputHeight

            placeholderText: "Recipe Name"

            required: true
        }

        Item {
            id: recipe_description_container
            Layout.row: 1
            //width: input_layout.width - 50
            //Layout.maximumWidth: input_layout.width
            Layout.fillWidth: true
            //Layout.minimumWidth: input_layout.width
            Layout.fillHeight: true
            Layout.minimumHeight: add_recipe_page.typicalInputHeight * 1.5
            Layout.maximumHeight: add_recipe_page.typicalInputHeight * 2.5

            CustomTextField {
                id: recipe_description_input

                anchors.fill: recipe_description_container

                //Layout.row: 1
                //Layout.fillWidth: true
                //Layout.minimumWidth: input_layout.width
                //Layout.minimumHeight: add_recipe_page.typicalInputHeight * 1.5
                //Layout.maximumHeight: add_recipe_page.typicalInputHeight * 2.5

                topPadding: 10 * uiCtxt.scale
                bottomPadding: 10 * uiCtxt.scale
                leftPadding: 20 * uiCtxt.scale
                rightPadding: 20 * uiCtxt.scale
                backgroundRadius: 40 * uiCtxt.scale

                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: TextInput.Wrap

                textPixelSize: recipe_name_input.textPixelSize
                placeholderText: "Enter description..."
            }
        }

        CustomTextField {
            id: recipe_type_input
            Layout.row: 2
            Layout.fillWidth: true
            //Layout.minimumWidth: input_layout.width
            height: add_recipe_page.typicalInputHeight
            Layout.maximumHeight: add_recipe_page.typicalInputHeight

            placeholderText: "Select Type of Recipe" // TODO
        }

        Item {
            id: recipe_keyword_input
            Layout.row: 3
            Layout.minimumHeight: add_recipe_page.typicalInputHeight * 2 + 5 * uiCtxt.scale
            Layout.fillWidth: true

            CustomTextField {
                id: recipe_keyword_text_input
                //x: 25 * uiCtxt.scale
                //y: 130 * uiCtxt.scale
                width: parent.width
                height: add_recipe_page.typicalInputHeight
                //width: parent.width - (50 * uiCtxt.scale)
                //height: 100 * uiCtxt.scale

                placeholderText: "Add Keywords" // TODO
            }

            Rectangle {
                id: added_keywords_list
                anchors.bottom: parent.bottom
                width: parent.width
                height: add_recipe_page.typicalInputHeight
                radius: 2/5 * height
                border.color: "#443311"
                border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
            }
        }

        Item {
            id: recipe_ingredient_input
            Layout.row: 4
            Layout.minimumHeight: add_recipe_page.typicalInputHeight * 4 + 5 * uiCtxt.scale
            Layout.fillWidth: true

            CustomTextField {
                id: recipe_ingredient_text_input
                //x: 25 * uiCtxt.scale
                //y: 130 * uiCtxt.scale
                width: parent.width
                height: add_recipe_page.typicalInputHeight
                //width: parent.width - (50 * uiCtxt.scale)
                //height: 100 * uiCtxt.scale

                placeholderText: "Add Ingredients" // TODO

                required: true
            }

            Rectangle {
                id: added_ingredients_list
                anchors.bottom: parent.bottom
                width: parent.width
                height: add_recipe_page.typicalInputHeight * 3
                radius: 2/15 * height
                border.color: "#443311"
                border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
            }
        }

        Item {
            id: recipe_steps_container
            Layout.row: 5
            //width: input_layout.width - 50
            //Layout.maximumWidth: input_layout.width
            Layout.fillWidth: true
            //Layout.minimumWidth: input_layout.width
            Layout.fillHeight: true
            Layout.minimumHeight: add_recipe_page.typicalInputHeight * 3
            //height: add_recipe_page.typicalInputHeight * 5.5
            Layout.maximumHeight: add_recipe_page.typicalInputHeight * 5.5

            CustomTextField {
                id: recipe_steps_input

                anchors.fill: recipe_steps_container

                topPadding: 15 * uiCtxt.scale
                bottomPadding: 15 * uiCtxt.scale
                leftPadding: 25 * uiCtxt.scale
                rightPadding: 25 * uiCtxt.scale
                backgroundRadius: 45 * uiCtxt.scale

                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: TextInput.Wrap

                textPixelSize: recipe_name_input.textPixelSize
                placeholderText: "Enter steps..."

                required: true
            }
        }

        Item {
            id: recipe_time_input
            Layout.row: 6
            Layout.minimumHeight: add_recipe_page.typicalInputHeight
            Layout.fillWidth: true

            RowLayout { // TODO Just use anchors.(left, horizontalCenter, and right)
                id: recipe_time_layout
                anchors.fill: recipe_time_input
                spacing: 15 * uiCtxt.scale
                //columns: 3
                //width: recipe_time_input.width
                //height: recipe_time_input.height

                CustomTextField {
                    id: recipe_prep_time_input
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.maximumWidth: recipe_time_input / 3 - recipe_time_layout.spacing * 2 / 3
                    height: recipe_time_input.height
                    Layout.maximumHeight: recipe_time_input.height

                    horizontalAlignment: Text.AlignHCenter

                    placeholderText: "Prep" // TODO
                }

                CustomTextField {
                    id: recipe_active_time_input
                    Layout.column: 1
                    Layout.fillWidth: true
                    Layout.maximumWidth: recipe_time_input / 3 - recipe_time_layout.spacing * 2 / 3
                    height: recipe_time_input.height
                    Layout.maximumHeight: recipe_time_input.height

                    horizontalAlignment: Text.AlignHCenter

                    placeholderText: "Active" // TODO
                }

                CustomTextField {
                    id: recipe_passive_time_input
                    Layout.column: 2
                    Layout.fillWidth: true
                    Layout.maximumWidth: recipe_time_input / 3 - recipe_time_layout.spacing * 2 / 3
                    height: recipe_time_input.height
                    Layout.maximumHeight: recipe_time_input.height

                    horizontalAlignment: Text.AlignHCenter

                    placeholderText: "Passive" // TODO
                }
            }
        }

        CustomTextField {
            id: recipe_yield_input
            //x: 25 * uiCtxt.scale
            //y: 130 * uiCtxt.scale
            Layout.row: 7
            Layout.fillWidth: true
            //Layout.minimumWidth: input_layout.width
            height: add_recipe_page.typicalInputHeight
            Layout.maximumHeight: add_recipe_page.typicalInputHeight

            placeholderText: "Yield"

            required: true
        }

        Item { // TODO Remove this outer Item?
            id: recipe_image_input
            Layout.row: 8
            Layout.minimumHeight: add_recipe_page.typicalInputHeight
            Layout.fillWidth: true

            RowLayout {
                id: recipe_image_layout
                anchors.fill: recipe_image_input
                //Layout.minimumWidth: recipe_image_input.width
                //Layout.minimumHeight: recipe_image_input.height
                spacing: 25 * uiCtxt.scale

                Rectangle {
                    id: upload_image_button
                    Layout.column: 0
                    //x: 25 * uiCtxt.scale
                    //y: 130 * uiCtxt.scale
                    Layout.minimumWidth: recipe_image_layout.width / 3
                    Layout.fillWidth: true
                    Layout.preferredHeight: recipe_image_input.height //add_recipe_page.typicalInputHeight
                    radius: height / 2
                    border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
                    border.color: "#443311"
                    color: "#DDBBAA"

                    Text {
                        id: upload_image_txt

                        anchors.centerIn: upload_image_button
                        width: upload_image_button.width // 726 * uiCtxt.scale
                        height: upload_image_button.height * 7 / 8 //160 * uiCtxt.scale

                        // TODO Use padding for top and bottom
                        color: "#664422"
                        font.bold: true
                        text: "Upload Image"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        fontSizeMode: Text.Fit
                        minimumPixelSize: 10
                        font.pixelSize: 122
                    }

                    Image {
                        x: -18 * uiCtxt.scale
                        y: -18 * uiCtxt.scale
                        width: 35 * uiCtxt.scale
                        height: 35 * uiCtxt.scale
                        sourceSize.width: 35
                        sourceSize.height: 35
                        fillMode: Image.PreserveAspectFit

                        source: "Images/Required Symbol.png"
                    }

                    TapHandler {
                        acceptedDevices: PointerDevice.TouchScreen
                        onTapped: console.log("--------------------------------------------- UPLOAD IMAGE ---------------------------------------------") // TODO
                        onLongPressed: console.log("--------------------------------------------- UPLOAD IMAGE ---------------------------------------------") // TODO
                    }
                }

                Rectangle {
                    id: gallery_button
                    Layout.column: 1
                    // TODO Layout.minimumWidth: recipe_image_layout.width * 5 / 53
                    Layout.preferredWidth: recipe_image_input.height
                    Layout.preferredHeight: recipe_image_input.height //add_recipe_page.typicalInputHeight
                    radius: height / 4
                    border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
                    border.color: "#443311"
                    color: "#FFDCCB"

                    Image {
                        anchors.centerIn: gallery_button
                        width: recipe_image_input.height * 0.75
                        height: recipe_image_input.height * 0.75
                        sourceSize.width: 75
                        sourceSize.height: 75
                        fillMode: Image.PreserveAspectFit

                        source: "Images/Gallery_Icon.png"
                    }

                    TapHandler {
                        acceptedDevices: PointerDevice.TouchScreen
                        onTapped: console.log("--------------------------------------------- GALLERY BUTTON PRESSED ---------------------------------------------") // TODO
                        onLongPressed: console.log("--------------------------------------------- GALLERY BUTTON PRESSED ---------------------------------------------") // TODO
                    }
                }

                Rectangle {
                    id: camera_button
                    Layout.column: 2
                    // TODO Layout.minimumWidth: recipe_image_layout.width * 5 / 53
                    Layout.preferredWidth: recipe_image_input.height
                    Layout.preferredHeight: recipe_image_input.height //add_recipe_page.typicalInputHeight
                    radius: height / 4
                    border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
                    border.color: "#443311"
                    color: "#FFDCCB"


                    Image {
                        anchors.centerIn: camera_button
                        width: recipe_image_input.height * 0.75
                        height: recipe_image_input.height * 0.54
                        sourceSize.width: 75
                        sourceSize.height: 54
                        fillMode: Image.PreserveAspectFit

                        source: "Images/Camera_Icon.png"
                    }

                    TapHandler {
                        acceptedDevices: PointerDevice.TouchScreen
                        onTapped: console.log("--------------------------------------------- CAMERA BUTTON PRESSED ---------------------------------------------") // TODO
                        onLongPressed: console.log("--------------------------------------------- CAMERA BUTTON PRESSED ---------------------------------------------") // TODO
                    }
                }
            }
        }

        Rectangle {
            id: add_recipe_button
            Layout.row: 9
            //Layout.minimumWidth: input_layout.width
            Layout.fillWidth: true
            Layout.minimumHeight: add_recipe_page.typicalInputHeight
            radius: height / 2
            border.width: (3 * uiCtxt.scale < 1) ? 1 : (3 * uiCtxt.scale)
            border.color: "#886655"
            color: "#BB9988"

            Text {
                id: add_recipe_txt

                anchors.centerIn: add_recipe_button
                width: add_recipe_button.width // 726 * uiCtxt.scale
                height: add_recipe_button.height * 7 / 8 //160 * uiCtxt.scale

                // TODO Use padding for top and bottom
                color: "#775544"
                font.weight: Font.Black
                text: "Add Recipe"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                font.pixelSize: 122
            }

            TapHandler {
                acceptedDevices: PointerDevice.TouchScreen
                onTapped: addToDatabase()
                onLongPressed: addToDatabase()
            }
        }

    }
/*
    CustomTextField {
        id: misc_input
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
            onTapped: addToDatabase() //dbActions.addData("Name1", 2) // TODO Inserts random data into database
            onLongPressed: addToDatabase() //dbActions.addData("Name1", 2) // TODO Inserts random data into database
        }
    }*/
}
