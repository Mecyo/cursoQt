import QtQuick 2.10
import QtQuick.Window 2.10
import QtWebView 1.1
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("My Web Browser")

    ColumnLayout{
        anchors.fill: parent

        RowLayout{
            ToolButton{
                text: "<"
                enabled: webView.canGoBack
                onClicked: webView.goBack()
            }
            ToolButton{
                text: ">"
                enabled: webView.canGoForward
                onClicked: webView.goForward()
            }

            TextField{
                text: webView.url
                Layout.fillWidth: true
                Keys.onReturnPressed: webView.url = text
                onPressed: selectAll()
                focus: true
                BusyIndicator{
                    anchors{ right: parent.right; verticalCenter: parent.verticalCenter}
                    running: webView.loading
                    z: 2
                }
            }
        }

        WebView{
            id: webView
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
        }
    }

}
