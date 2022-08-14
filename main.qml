import QtQuick 2.4
//import QtQuick.Shapes 1.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
//import "Images"

Window {
    id: root
    width: 411
    height: 891
    visible: true
    visibility: "FullScreen"
    color: "#503929"
    title: qsTr("Home Page")

    Image {
        id: dashed_lines
        x: 11.5
        y: 11.5
        source: "Home_Page_Dashed_Lines.png"
        width: 388//1010
        height: 868//2270
        sourceSize.width: 1020
        sourceSize.height: 2280
        //scale: scaleCtx.scale
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: randomImg
        x: 100
        y: 100
        source: "Untitled.png"
        height:132
        width:132
        sourceSize.height:132
        sourceSize.width:132
    }

    Rectangle {
        id: rectangle
        x: 6
        y: 116
        width: 399
        height: 97
        color: "#ffffff"

        Text {
            text: "Sup dude hope this fits"
            width: 399
            height: 97
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 600
        }
    }

    /* TODO Reference this text (bounded by a rectangle/box
    Text {
        text: "Sup dude hope this fits"
        width: 399
        height: 5
        fontSizeMode: Text.Fit // TODO Reference this text (bounded by a rectangle/box
        minimumPixelSize: 10
        font.pixelSize: 600
    }*/

    Text {
        id: welcome_title
        x: -206
        y: 237
        width: 822
        height: 300
        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:64pt; font-weight:700; color:#ffffff;\">Welcome to</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:96pt; font-weight:700; color:#ffffff;\">Recipe Finder</span></p></body></html>"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        scale: 0.5
        font.family: "Verdana"
        textFormat: Text.RichText
    }


    Rectangle {
        id: search_recipes_rect
        x: 21
        y: 381
        width: 369
        height: 122
        color: "#443322"
        radius: 48
        border.color: "#221100"
        border.width: 4
        //scale: 0.5

        Text {
            id: search_recipes_txt
            width: 369
            height: 122
            color: "#ffffff"
            text: qsTr("Search Recipes")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            //scale: 0.5
            textFormat: Text.RichText
            font.family: "Verdana"
            font.bold: true
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }
    }

    Rectangle {
        id: add_recipes_rect
        x: 21
        y: 571
        width: 369
        height: 122
        color: "#443322"
        radius: 48
        border.color: "#221100"
        border.width: 4
        //scale: 0.5

        Text {
            id: add_recipes_txt
            width: 369
            height: 122
            color: "#ffffff"
            text: qsTr("Add Recipes")
            // TODO
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            //scale: 0.5
            //textFormat: Text.RichText
            //font.family: "Verdana"
            //font.bold: true
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            font.pixelSize: 122
        }
    }




/*
    Text {
        id: welcome_title2
        x: -207
        y: -75
        width: 822
        height: 300
        color: "#ffffff"
        text: "Recipe Finder"
        font.pointSize: 136
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.family: "Arial"
        scale: 1/2.625
        textFormat: Text.RichText
    }

    Text {
        id: welcome_title3
        x: -208
        y: 393
        width: 822
        height: 300
        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:64pt; font-weight:700; color:#ffffff;\">Welcome to</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:96pt; font-weight:700; color:#ffffff;\">Recipe Finder</span></p></body></html>"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Verdana"
        scale: 0.5
        textFormat: Text.RichText
    }

    Text {
        id: welcome_title4
        x: -209
        y: 549
        width: 822
        height: 300
        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:64pt; font-weight:700; color:#ffffff;\">Welcome to</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:96pt; font-weight:700; color:#ffffff;\">Recipe Finder</span></p></body></html>"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Verdana"
        scale: 0.5
        textFormat: Text.RichText
    }

    Text {
        id: welcome_title5
        x: -206
        y: 730
        width: 822
        height: 100
        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:96pt; font-weight:700; color:#ffffff;\">Recipe Finder</span></p></body></html>"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Verdana"
        scale: 0.5
        textFormat: Text.RichText
    }*/
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:1}D{i:3}D{i:2}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}
D{i:11}D{i:12}
}
##^##*/
