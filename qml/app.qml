import QtQuick 6
import QtQuick.Window 2.15
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window 
    width: 760
    height: 500
    visible: true
    title: qsTr("App Home")

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue
}
