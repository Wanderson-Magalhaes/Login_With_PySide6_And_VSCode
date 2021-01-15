import QtQuick 6
import QtQuick.Window 2.15
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window 
    width: 400
    height: 580
    visible: true
    title: qsTr("Login Page")

    // SET FLAGS
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    
    // QtObject {
    //     id: internal
    //     property string user: "wanderson"
    //     property string pass: "123456"

    //     // CHECK LOGIN FUNCTION
    //     function checkLogin(username, password) {
    //         if(username === user && password === pass){
    //             var component = Qt.createComponent("app.qml")
    //             var win = component.createObject()
    //             win.show()
    //             visible = false
    //         } else{

    //             // CHANGE USER COLOR
    //             if(username !== user){
    //                 usernameField.Material.foreground = Material.Pink
    //                 usernameField.Material.accent = Material.Pink
    //             } else {
    //                 usernameField.Material.foreground = Material.LightBlue
    //                 usernameField.Material.accent = Material.LightBlue
    //             }

    //             // CHANGE PASS COLOR
    //             if(password !== pass){
    //                 passwordField.Material.foreground = Material.Pink
    //                 passwordField.Material.accent = Material.Pink
    //             } else {
    //                 passwordField.Material.foreground = Material.LightBlue
    //                 passwordField.Material.accent = Material.LightBlue
    //             }
    //         }
    //     }
    // }
    

    // CREATE TOP BAR
    Rectangle{
        id: topBar
        height: 40
        color: Material.color(Material.Blue)
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 10
        }
        radius: 10

        Text{
            text: qsTr("LOGIN PAGE")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
    }

    // IMAGE IMPORT
    Image{
        id: image 
        width: 300
        height: 120
        source: "../images/logo.png"        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 60
    }

    // TEXT FIELD USERNAME
    TextField{
        id: usernameField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Your username or email")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 60
    }

    // TEXT FIELD USERNAME
    TextField{
        id: passwordField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Your password")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: usernameField.bottom
        anchors.topMargin: 10
        echoMode: TextInput.Password
    }

    // CHECKBOX SAVE PASS
    CheckBox{
        id: checkBox
        text: qsTr("Save password")
        anchors.top: passwordField.bottom
        anchors.topMargin: 10        
        anchors.horizontalCenter: parent.horizontalCenter
        
    }

    // BUTTON LOGIN
    Button{
        id: buttonLogin
        width: 300
        text: qsTr("Login")
        anchors.top: checkBox.bottom
        anchors.topMargin: 10        
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: backend.checkLogin(usernameField.text, passwordField.text)
    }

    
    Connections {
        target: backend

        // CUSTOM PROPERTIES
        property string username: ""
        property string password: ""
        function onSignalUser(myUser){ username = myUser }
        function onSignalPass(myPass){ password = myPass }

        // FUNTION OPEN NEW WINDOW (APP WINDOW)
        function onSignalLogin(boolValue) {
            if(boolValue){
                var component = Qt.createComponent("app.qml")
                var win = component.createObject()
                win.textUsername = username
                win.textPassword = password
                win.show()
                visible = false
            } else{
                // CHANGE USER COLOR
                usernameField.Material.foreground = Material.Pink
                usernameField.Material.accent = Material.Pink
                passwordField.Material.foreground = Material.Pink
                passwordField.Material.accent = Material.Pink
            }
        }
    }    
}
