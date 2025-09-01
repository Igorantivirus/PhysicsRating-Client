import QtQuick
import QtQuick.Controls

Page
{
    id: page2
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

                text: "О разработчиках"
                font.pointSize: 24
                font.bold: true
            }
            Label
            {
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6

                text: "Разработчик приложения: Антипов Игорь\nРазработчик таблицы рейтинга: Штыгашева О.Г."
                font.pointSize: 16
                font.bold: true
                wrapMode: Text.WordWrap
            }
            Button
            {
                id: schooseFileB

                horizontalPadding: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                topPadding: 10
                bottomPadding: 10

                text: "Телеграм разработчика"
                font.pointSize: 16
                font.bold: true

                onClicked: Qt.openUrlExternally("https://t.me/igorantivirus")
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

                onClicked: page2.stackView.pop()
            }
        }
    }
}
