import QtQuick
import QtQuick.Controls

Page
{
    id: page3
    property StackView stackView

    Item
    {
        anchors.fill: parent

        Column
        {
            id: column

            anchors.centerIn: parent
            width: parent.width
            spacing: 20
            padding: 20

            Label
            {
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6

                text: "Ввод пароля"
                font.pointSize: 24
                font.bold: true
            }

            TextField
            {
                id: passwordField

                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                background: Rectangle
                {
                    border.color: passwordField.activeFocus ? "blue" : "gray"
                    border.width: 1
                    radius: 2
                }

                placeholderText: (activeFocus || text.length !== 0) ? "" : "Введите пароль"
                font.pointSize: 16
                font.bold: true
            }
            Button
            {
                id: schooseFileB

                horizontalPadding: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                text: "Войти"
                font.pointSize: 16
                font.bold: true

                onClicked:
                {
                    if(back.autorezite(passwordField.text))
                    {
                        errorLogL.text = "";
                        page3.stackView.push("OutputPage.qml", { stackView: page3.stackView })
                    }
                    else
                    {
                        errorLogL.text = "Неверный пароль.";
                    }
                }
            }
            Button
            {
                horizontalPadding: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                text: "Назад"
                font.pointSize: 16
                font.bold: true

                onClicked: page3.stackView.pop()
            }
            Label
            {
                id: errorLogL

                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6

                text: ""
                font.pointSize: 12
                font.bold: true
            }
        }
        Label
        {
            width: parent.width * 0.6
            anchors
            {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: "Подсказка: пароль - \"Номер в группе\"+\"номер группы\""
            font.pointSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }
}
