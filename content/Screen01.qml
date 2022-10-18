/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.3
import QtQuick.Controls 6.3
import ToDoDemo
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    property bool isDialogOpen: false

    Text {
        id: text1
        text: qsTr("To Do")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 10
    }

    Button {
        id: addToDoButton
        y: 491
        text: qsTr("Add To Do")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10

        Connections {
            target: addToDoButton
            onClicked: rectangle.isDialogOpen = !rectangle.isDialogOpen
        }
    }


    Rectangle {
        id: addToDoDialog
        x: 10
        y: 570
        width: 380
        height: 166
        visible: rectangle.isDialogOpen
        color: "#d6d7d7"
        radius: 30

        TextField {
            id: toDoTextInput
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pointSize: 20
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            anchors.topMargin: 25
            placeholderText: qsTr("Add To Do")
        }

        RowLayout {
            y: 110
            height: 48
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            spacing: 50
            Button {
                id: cancelButton
                text: qsTr("Cancel")
                Layout.fillWidth: true

                Connections {
                    target: cancelButton
                    onClicked: rectangle.isDialogOpen = false
                }

                Connections {
                    target: cancelButton
                    onClicked: toDoTextInput.text = ""
                }
            }

            Button {
                id: addButton
                text: qsTr("Add")
                Layout.fillWidth: true

                Connections {
                    target: addButton
                    onClicked: rectangle.isDialogOpen = false
                }

                Connections {
                    target: addButton
                    onClicked: myListModel.append(myListModel.createListElement())
                }
            }
        }
    }


    Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 20
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 100
        anchors.topMargin: 50

        Repeater {
            id: repeater
            anchors.fill: parent
            model: ListModel {
                id: myListModel
                ListElement {
                    name: "My To Do"
                }
                function createListElement() {
                       return {
                        "name": toDoTextInput.text
                    }
                }
            }

            Rectangle {
                id: toDoItem
                x: 0
                y: 26
                width: 382
                height: 57
                color: "#d6d7d7"
                radius: 10

                CheckBox {
                    id: checkBox
                    text: name
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pointSize: 22
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }
            }
        }
    }

    states: [
        State {
            name: "clicked"
            when: addToDoButton.checked
        }
    ]
}
