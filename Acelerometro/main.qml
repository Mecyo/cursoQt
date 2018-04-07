import QtQuick 2.10
import QtQuick.Window 2.10
import QtSensors 5.9

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Acelerômetro e Sensor de Proximidade")

    property var pixelDensity

    Component.onCompleted: pixelDensity = Screen.logicalPixelDensity

    Rectangle{
        id: ballPoint
        x: window.width - window.width/2
        y: window.height - window.height/2
        width: 24 * pixelDensity
        height: 24 * pixelDensity
        color: "green"
        radius: width/2

        Behavior on x {NumberAnimation {duration: 100}}
        Behavior on y {NumberAnimation {duration: 100}}
    }

    Accelerometer{
        active: true
        dataRate: 20
        onReadingChanged: {
            var newX = ballPoint.x - reading.x * pixelDensity * 30
            var newY = ballPoint.y + reading.y * pixelDensity * 30

            if(newX + ballPoint.width > window.width)
                newX = window.width - ballPoint.width

            if(newY + ballPoint.height > window.height)
                newY = window.height - ballPoint.height

            if(newX < 0)
                newX = 0

            if(newY < 0)
                newY = 0

            ballPoint.x = newX
            ballPoint.y = newY
        }
    }

    ProximitySensor{
        active: true
        dataRate: 20
        onReadingChanged: ballPoint.color = (reading.near) ? "gray" : "green"
    }
}
