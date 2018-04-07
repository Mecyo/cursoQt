import QtQuick 2.10
import QtQuick.Window 2.10
import QtMultimedia 5.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("multimídia")

    property var availableCameras: QtMultimedia.availableCameras
    property int currentCamera: 0

   ColumnLayout{
       spacing: 20
       anchors.fill: parent
       VideoOutput{
            Layout.fillWidth: true
            Layout.fillHeight: true
            source: Camera{id: camera}
            autoOrientation: true
       }
       RowLayout{
           spacing: 20
           width: parent.width
            Label{
                Layout.fillWidth: true
                text: camera.displayName
            }
            Button{
                text: "Click"
                onClicked: {
                    camera.imageCapture
                    if(currentCamera >= availableCameras.length)
                        currentCamera = 0
                    camera.deviceId = availableCameras[currentCamera].deviceId
                }
            }
            Button{
                text: "Alternar Câmera"
                onClicked: {
                    currentCamera++
                    if(currentCamera >= availableCameras.length)
                        currentCamera = 0
                    camera.deviceId = availableCameras[currentCamera].deviceId
                }
            }
       }
   }

   /*Item {
      width: 640
      height: 360

      Camera {
          id: camera

          imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

          exposure {
              exposureCompensation: -1.0
              exposureMode: Camera.ExposurePortrait
          }

          flash.mode: Camera.FlashRedEyeReduction

          imageCapture {
              onImageCaptured: {
                  photoPreview.source = preview  // Show the preview in an Image
              }
          }
      }

      VideoOutput {
          source: camera
          anchors.fill: parent
          focus : visible // to receive focus and capture key events when visible
      }

      Image {
          id: photoPreview
      }
  }*/
}
