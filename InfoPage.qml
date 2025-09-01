import QtQuick
import QtQuick.Controls

Page
{
    id: page5
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

                text: "О приложении"
                font.pointSize: 24
                font.bold: true
            }
            Label
            {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Math.min(parent.width * 0.8, 600)
                topPadding: 10
                bottomPadding: 10
                leftPadding: 15
                rightPadding: 15

                text: "Приложение предназначено для просмотра файлов рейтинга по физике (формат .bin).\n\n" +
                      "Если при выборе файла из папки 'Загрузки' или другой системной директории возникла ошибка:\n" +
                      "1. Убедитесь, что выбран правильный файл\n" +
                      "2. Попробуйте открыть его через полный путь: <Память телефона>/Downloads\n\n" +
                      "Ошибка чтения обычно означает либо выбор неверного файла, либо проблемы с доступом к системным папкам."

                font.pointSize: 14
                font.bold: false
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                lineHeight: 1.2
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

                onClicked: page5.stackView.pop()
            }
        }
    }
}
