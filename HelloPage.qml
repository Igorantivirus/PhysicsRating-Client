import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Page
{
    id: page1
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

                text: "Рейтинг по физике"
                font.pointSize: 24
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

                text: "Выбрать файл"
                font.pointSize: 16
                font.bold: true

                onClicked: fileDialog.open()
            }
            Button
            {
                id: openFileB
                horizontalPadding: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                enabled: false

                text: "Ввод пароля"
                font.pointSize: 16
                font.bold: true

                onClicked:
                {
                    if(back.fileParsed())
                        page1.stackView.push("RegisterPage.qml", { stackView: page1.stackView })
                    else
                        errorLogL.text = "Файл не выбран"
                }
            }
            Button
            {
                horizontalPadding: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                text: "О разработчиках"
                font.pointSize: 16
                font.bold: true

                onClicked: page1.stackView.push("AboutPage.qml", { stackView: page1.stackView })
            }
            Button
            {
                horizontalPadding: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                text: "О приложении"
                font.pointSize: 16
                font.bold: true

                onClicked: page1.stackView.push("InfoPage.qml", { stackView: page1.stackView })
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
            text: "Версия - 1.1.0"
            font.pointSize: 12
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }
    }

    FileDialog
    {
        id: fileDialog
        fileMode: FileDialog.OpenFile
        onAccepted:
        {
            if (back.openFile(selectedFile))
            {
                errorLogL.text = "Файл успешно выбран."
                openFileB.enabled = true
            }
            else
            {
                errorLogL.text = "Не удалось открыть файл.\nПоищите решение в разделе \'О приложении\""
                openFileB.enabled = false
            }
        }
    }
}
