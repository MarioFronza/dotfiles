#!/bin/sh
# Status line simples pro swaybar nativo — texto puro, sem ícones.
#
# Volume atualiza na hora: "pactl subscribe" escuta eventos de
# volume/mute (de qualquer origem — teclado, outro app, etc.) e manda
# SIGUSR1 pro processo principal, que interrompe o sleep e redesenha a
# linha imediatamente, sem esperar o polling de 5s.
trap : USR1

(
    pactl subscribe 2>/dev/null | while read -r line; do
        case "$line" in
            *"on sink"*) kill -USR1 $$ 2>/dev/null ;;
        esac
    done
) &

while true; do
    # Rede
    iface=$(ip route get 1.1.1.1 2>/dev/null | sed -n 's/.*dev \([^ ]*\).*/\1/p')
    if [ -z "$iface" ]; then
        network="Offline"
    else
        case "$iface" in
            wl*)
                rssi=$(iwctl station "$iface" show 2>/dev/null | sed 's/\x1b\[[0-9;]*m//g' | awk '/^ *RSSI/{print $2; exit}')
                if [ -n "$rssi" ]; then
                    pct=$(( (rssi + 100) * 2 ))
                    [ "$pct" -lt 0 ] && pct=0
                    [ "$pct" -gt 100 ] && pct=100
                    network="WiFi ${pct}%"
                else
                    network="WiFi conectado"
                fi
                ;;
            *)
                network="Ethernet conectado"
                ;;
        esac
    fi

    # Volume
    vol_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
    if echo "$vol_raw" | grep -q MUTED; then
        volume="Muted"
    else
        vol_pct=$(echo "$vol_raw" | awk '{printf "%d", $2*100}')
        volume="Volume ${vol_pct}%"
    fi

    # Bateria
    if [ -d /sys/class/power_supply/BAT0 ]; then
        cap=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status)
        if [ "$status" = "Charging" ]; then
            battery="Battery ${cap}% (charging)"
        else
            battery="Battery ${cap}%"
        fi
    else
        battery=""
    fi

    date_str=$(LC_TIME=en_US.UTF-8 date '+%A, %d %B %Y · %H:%M')

    printf '%s   |   %s   |   %s   |   %s\n' "$network" "$volume" "$battery" "$date_str"
    sleep 5 &
    wait $!
done
