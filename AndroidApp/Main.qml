import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow  {
    id: mainWindow
    visible: true
    visibility: Window.FullScreen
    width: 400
    height: 300
    title: "Random Coffee"

    Window {
        id: reg_window
        visible: false
        Rectangle {
            color: "#F9F9F9"
            anchors.fill: parent

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 10

                Item {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    width: 256
                    height: 256
                    Image {
                        id: icon
                        width: 256
                        height: 256
                        source: "icon.png"
                    }
                }

                TextField {
                    placeholderText: "E-mail"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                }

                TextField {
                    placeholderText: "Номер телефона"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                }

                TextField {
                    placeholderText: "Пароль"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    echoMode: TextInput.Password
                }

                TextField {
                    placeholderText: "Повторите пароль"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    echoMode: TextInput.Password
                }

                TextField {
                    placeholderText: "Фамилия"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                }

                TextField {
                    placeholderText: "Имя"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                }

                TextField {
                    placeholderText: "Отчество"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                }

                Button {
                    id: reg_btn
                    text: "Зарегистрироваться"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    background: Rectangle {
                        color: "#ff5c00"
                        radius: 10
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter // Центрирование текста по горизонтали
                        verticalAlignment: Text.AlignVCenter // Центрирование текста по вертикали
                    }

                    onClicked: {
                        myObject.onButtonClicked(0);
                        reg_window.visible = false;
                        main_app.visible = true;
                    }

                    onPressed: {
                        reg_btn.background.color = "#ad3c00";
                    }

                    onReleased: {
                        reg_btn.background.color = "#ff5c00";
                    }
                }

                Button {
                    id: go_to_login
                    text: "Уже есть аккаунт? Войти"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    background: Rectangle {
                        color: "transparent"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#ff5c00"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter // Центрирование текста по горизонтали
                        verticalAlignment: Text.AlignVCenter // Центрирование текста по вертикали
                        font.underline: true
                    }

                    onClicked: {
                        reg_window.visible = false;
                        auth_window.visible = true;
                    }
                }
            }
        }
    }

    Window {
        id: auth_window
        visible: true
        Rectangle {
            color: "#F9F9F9"
            anchors.fill: parent

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 10

                Item {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    width: 256
                    height: 256
                    Image {
                        id: icon_
                        width: 256
                        height: 256
                        source: "icon.png"
                    }
                }

                TextField {
                    placeholderText: "E-mail"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                }

                TextField {
                    placeholderText: "Пароль"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    echoMode: TextInput.Password
                }

                Button {
                    id: login_btn
                    text: "Авторизоваться"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    background: Rectangle {
                        color: "#ff5c00"
                        radius: 10
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter // Центрирование текста по горизонтали
                        verticalAlignment: Text.AlignVCenter // Центрирование текста по вертикали
                    }

                    onClicked: {
                        myObject.onButtonClicked(1);
                        auth_window.visible = false;
                        main_app.visible = true;
                    }

                    onPressed: {
                        login_btn.background.color = "#ad3c00";
                    }

                    onReleased: {
                        login_btn.background.color = "#ff5c00";
                    }
                }

                Button {
                    id: go_to_reg
                    text: "Ещё не зарегестрировались? Регистрация"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    background: Rectangle {
                        color: "transparent"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#ff5c00"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter // Центрирование текста по горизонтали
                        verticalAlignment: Text.AlignVCenter // Центрирование текста по вертикали
                        font.underline: true
                    }

                    onClicked: {
                        reg_window.visible = true;
                        auth_window.visible = false;
                    }
                }
            }
        }
    }

    Window {
        id: main_app
        visible: false

        Rectangle {
            id: chat_list
            color: "#3b3e49"
            anchors { top: header_.bottom; bottom: footer_.top; left: parent.left; right: parent.right }
            visible: true;
            ListModel {
                id: chatModel
                ListElement { name: "Кирилл"; surname: "Трубецкой"; avatar: "users_default.png" }
                ListElement { name: "Владислав"; surname: "Гордиенко"; avatar: "users_default.png" }
                ListElement { name: "Мамин"; surname: "Данил"; avatar: "users_default.png" }
            }

            ListView {
                id: chats_
                anchors.fill: parent
                model: chatModel
                spacing: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10

                delegate: Item {
                    width: parent.width
                    height: 80

                    Rectangle {
                        color: "#333"
                        width: parent.width - 10
                        anchors { horizontalCenter: parent.horizontalCenter }
                        height: 80
                        radius: 10

                        Rectangle {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            width: 60
                            height: 60
                            id: avatar_
                            anchors.leftMargin: 10
                            color: "transparent"
                            Image {
                                width: 60
                                height: 60
                                source: avatar
                            }
                        }

                        Text {
                            text: name + " " + surname
                            color: "white"
                            font.pixelSize: 16
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: avatar_.right
                            anchors.leftMargin: 10
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                chat_list.visible = false
                                chat_.visible = true
                                footer_.visible = false;
                                msg_send.visible = true;
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: chat_
            color: "#3b3e49"
            anchors { top: header_.bottom; bottom: footer_.top; left: parent.left; right: parent.right }
            visible: false;
            ListModel {
                id: messageModel
                ListElement { name: "Кирилл"; message: "Дарова!" }
                ListElement { name: "Вы"; message: "Привет! Как дела?" }
                ListElement { name: "Кирилл"; message: "Отлично!" }
            }

            ListView {
                anchors.fill: parent
                model: messageModel
                spacing: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                delegate: Item {
                    width: parent.width - 10
                    height: message_text.height + 30
                    Rectangle {
                        color: "#333"
                        width:{
                            if(message_text.width < parent.width && name_text.width < parent.width){
                                if(message_text.width < name_text.width){
                                    name_text.width + 20
                                }
                                else {
                                    message_text.width + 20
                                }
                            }
                            else{
                                parent.width
                            }
                        }
                        height: message_text.height + 30
                        anchors {
                            right: name === "Вы" ? parent.right : undefined
                            left: name === "Вы" ? undefined : parent.left
                        }
                        radius: 10
                        Text {
                            id: name_text
                            text: name
                            color: "#ff5c00"
                            font.pixelSize: 16
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.topMargin: 10
                        }

                        Text {
                            id: message_text
                            text: message
                            color: "white"
                            font.pixelSize: 16
                            anchors.top: name_text.bottom
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }

        Row {
            id: header_
            anchors.top: parent.top
            height: 70
            width: parent.width
            visible: true
            Rectangle {
                color: "#ffcc23"
                anchors { fill: parent; margins: 0 }

                Rectangle {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    width: 60
                    height: 60
                    id: you_
                    anchors.leftMargin: 10
                    color: "transparent"
                    Image {
                        width: 60
                        height: 60
                        source: "users_default.png"
                    }
                }

                Text {
                    text: "Иванов Иван Иванович"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: you_.right
                    anchors.leftMargin: 10
                }
            }
        }

        Row {
            id: footer_
            anchors.bottom: parent.bottom
            height: 50 // Height of the static footer
            width: parent.width
            visible: true
            Rectangle {
                color: "#ffcc23"
                anchors { fill: parent; margins: 0 }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 50
                    id: chats_btn
                    color: "transparent"
                    Image {
                        width: 50
                        height: 50
                        source: "user_u.png"
                    }
                }
            }
        }

        Row {
            id: msg_send
            anchors.bottom: parent.bottom
            height: 50 // Height of the static footer
            width: parent.width
            visible: false

            Rectangle {
                color: "#ffcc23"
                anchors { fill: parent; margins: 0 }

                TextField {
                    id: input_msg
                    placeholderText: "Введите сообщение"
                    width: parent.width - 50
                    anchors.left: parent.left
                    Layout.preferredHeight: 50
                }

                Rectangle {
                    anchors.left: input_msg.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 50
                    id: send_msg_btn
                    color: "#ff5c00"
                    radius: 25
                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: 25
                        height: 25
                        color: "transparent"
                        Image {
                            width: 25
                            height: 25
                            source: "send.png"
                        }
                    }
                }
            }
        }
    }

    Window {
        id: example_window
        visible: false

        Rectangle {
            color: "#F9F9F9"
            anchors.fill: parent

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 10

                Button {
                    id: example_button
                    text: "Examle"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    background: Rectangle {
                        color: "#ff5c00"
                        radius: 10
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter // Центрирование текста по горизонтали
                        verticalAlignment: Text.AlignVCenter // Центрирование текста по вертикали
                    }

                    onClicked: {
                        console.log("Кнопка");
                    }

                    onPressed: {
                        login_btn.background.color = "#ad3c00";
                    }

                    onReleased: {
                        login_btn.background.color = "#ff5c00";
                    }
                }

                Button {
                    id: href_example
                    text: "Гиперссылка"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    background: Rectangle {
                        color: "transparent"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.underline: true
                    }

                    onClicked: {
                        console.log("Гиперссылка");
                    }
                }
            }
        }
    }
}
