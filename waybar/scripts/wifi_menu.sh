#!/bin/sh

ROFI="rofi -dmenu -i -p WiFi"

notify() {
    notify-send "WiFi Manager" "$1"
}

wifi_status() {
    nmcli radio wifi
}

toggle_wifi() {
    if [ "$(wifi_status)" = "enabled" ]; then
        nmcli radio wifi off && notify "WiFi turned OFF"
    else
        nmcli radio wifi on && notify "WiFi turned ON"
    fi
}

disconnect_wifi() {
    nmcli device disconnect wlan0 2>/dev/null && notify "Disconnected"
}

connect_known() {
    KNOWN=$(nmcli -t -f NAME connection show | grep -v "^lo$")
    CHOICE=$(printf "%s\n" "$KNOWN" | $ROFI -p "Known Networks")
    [ -z "$CHOICE" ] && exit 0
    nmcli connection up "$CHOICE" && notify "Connected to $CHOICE"
}

connect_new() {
    nmcli device wifi rescan
    NETWORKS=$(nmcli -t -f SSID,SECURITY,SIGNAL device wifi list | sort -u)
    CHOICE=$(printf "%s\n" "$NETWORKS" | $ROFI -p "Available Networks")
    [ -z "$CHOICE" ] && exit 0

    SSID=$(echo "$CHOICE" | cut -d: -f1)
    SECURITY=$(echo "$CHOICE" | cut -d: -f2)

    if [ "$SECURITY" = "--" ]; then
        nmcli device wifi connect "$SSID" && notify "Connected to $SSID"
    else
        PASS=$(printf "" | rofi -dmenu -password -p "Password for $SSID")
        [ -z "$PASS" ] && exit 0
        nmcli device wifi connect "$SSID" password "$PASS" && notify "Connected to $SSID"
    fi
}

current_connection() {
    nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2
}

main_menu() {
    STATUS=$(wifi_status)
    CURRENT=$(current_connection)

    MENU="Toggle WiFi ($STATUS)\nConnect (known)\nConnect (new)\nDisconnect ($CURRENT)\nQuit"
    CHOICE=$(printf "$MENU" | $ROFI -p "WiFi Manager")

    case "$CHOICE" in
        "Toggle WiFi"*) toggle_wifi ;;
        "Connect (known)") connect_known ;;
        "Connect (new)") connect_new ;;
        "Disconnect"*) disconnect_wifi ;;
        *) exit 0 ;;
    esac
}

main_menu
