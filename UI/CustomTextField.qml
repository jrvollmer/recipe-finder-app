import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    property bool required: false
    property double textPixelSize: height - topPadding - bottomPadding
    property double backgroundRadius: 50 * uiCtxt.scale
    // TODO property to use "fit text" or "pixel size". Then, use this in their corresponding properties to set either fit text or use a determined pixel size
    // TODO Test fit text with padding and see if it works. If not, use a text box for sizing instead of padding. Then, fit text will work.

    width: 350 * uiCtxt.scale
    height: 100 * uiCtxt.scale

    leftPadding: 25 * uiCtxt.scale
    rightPadding: 25 * uiCtxt.scale
    bottomPadding: 15 * uiCtxt.scale
    topPadding: 15 * uiCtxt.scale

    color: "#000000"
    font.bold: true // TODO Keep?
    font.pixelSize: textPixelSize - 6 // -6 because of additional bottom padding
    //placeholderTextColor: "#BCBCBC" // TODO
    placeholderText: "Enter text..."

    focus: false
    selectByMouse: true

    background: Rectangle {
        width: parent.width
        height: parent.height
        radius: parent.backgroundRadius
        border.color: "#443311"
        border.width: (2 * uiCtxt.scale < 1) ? 1 : (2 * uiCtxt.scale)
    }

    onAccepted: {
        // Move the cursor (and consequently the displayed text) back to the beginning
        // of the input and remove focus when the user presses the Enter/Done key
        this.cursorPosition = 0;
        this.focus = false;
        console.log(this.text);
    }

    Image {
        x: -18 * uiCtxt.scale
        y: -18 * uiCtxt.scale
        width: 35 * uiCtxt.scale
        height: 35 * uiCtxt.scale
        sourceSize.width: 35
        sourceSize.height: 35
        fillMode: Image.PreserveAspectFit

        visible: parent.required
        source: "Images/Required Symbol.png"
    }
}


