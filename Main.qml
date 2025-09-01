import QtQuick.Controls

ApplicationWindow
{
    visible: true
    width: 480
    height: 700
    title: qsTr("Рейтинг по физике")

    StackView
    {
        id: stackView
        anchors.fill: parent
        initialItem: HelloPage {stackView: stackView}
    }
}
