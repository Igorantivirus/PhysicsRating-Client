import QtQuick
import QtQuick.Controls

Page
{
    id: page4
    property StackView stackView

    bottomPadding: 10

    Component.onCompleted:
    {
        namesL.text = back.getNames();
        infoL.text = back.getInfo();
        practicL.text = back.getPracticInfo();
        rgzL.text = back.getPracticRGZ();
    }

    ScrollView
    {
        id: scrollView
        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: backB.top
        }
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        contentWidth: availableWidth

        Column
        {
            width: scrollView.availableWidth
            anchors.centerIn: parent
            spacing: 20
            padding: 20

            //StudentInfo
            Label
            {
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                wrapMode: Text.WordWrap

                text: "Информация в рейтинге"
                font.pointSize: 16
                font.bold: true
            }

            Row
            {
                width: parent.width
                spacing: 20
                leftPadding: 16
                rightPadding: 16
                anchors.horizontalCenter: parent.horizontalCenter

                Label
                {
                    id: namesL

                    horizontalAlignment: Text.AlignLeft

                    text: ""
                    font.pointSize: 16
                    font.bold: true
                }

                Label
                {
                    id: infoL

                    horizontalAlignment: Text.AlignLeft

                    text: ""
                    font.pointSize: 16
                    font.bold: true
                }
            }

            //practicInfo

            Row
            {
                width: parent.width
                spacing: 20
                leftPadding: 16
                rightPadding: 16
                anchors.horizontalCenter: parent.horizontalCenter

                Label
                {
                    id: practicL

                    horizontalAlignment: Text.AlignLeft

                    text: ""
                    font.pointSize: 16
                    font.bold: true
                }

                Label
                {
                    id: rgzL

                    horizontalAlignment: Text.AlignLeft

                    text: ""
                    font.pointSize: 16
                    font.bold: true
                }
            }
        }
    }
    Button
    {
        id: backB
        horizontalPadding: Text.AlignHCenter
        anchors
        {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width * 0.6
        topPadding: 10
        bottomPadding: 10

        text: "Назад"
        font.pointSize: 16
        font.bold: true

        onClicked: page4.stackView.pop()
    }
}
