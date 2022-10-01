import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    property bool required: false

    color: "#000000"
    font.pixelSize: 20 // TODO Set to something that scales/fits the input
    font.bold: true // TODO Keep?
    placeholderText: "Enter text..."
    //placeholderTextColor: "#CCCCCC" // TODO
    width: 350 * uiCtxt.scale
    height: 100 * uiCtxt.scale
    //width: 250 * uiCtxt.scale
    //height: 100 * uiCtxt.scale
    focus: false
    leftPadding: 25 * uiCtxt.scale
    rightPadding: 25 * uiCtxt.scale
    bottomPadding: 0
    topPadding: 0
    selectByMouse: true

    background: Rectangle {
        //x: 25 * uiCtxt.scale
        //y: 130 * uiCtxt.scale
        width: parent.width
        height: parent.height
        radius: 50 * uiCtxt.scale
        border.color: "#443311"
        border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
    }

    onAccepted: {//EditingFinished: {
        // Move the cursor (and consequently the displayed text) back to the beginning
        // of the input and remove focus when the user presses the Enter/Done key
        this.cursorPosition = 0;
        this.focus = false;
        console.log(this.text);
    }

    Image {
        visible: parent.required
        source: "Images/Required Symbol.png"
        x: -18 * uiCtxt.scale
        y: -18 * uiCtxt.scale
        width: 35 * uiCtxt.scale
        height: 35 * uiCtxt.scale
        sourceSize.width: 35
        sourceSize.height: 35
        fillMode: Image.PreserveAspectFit
    }
}
