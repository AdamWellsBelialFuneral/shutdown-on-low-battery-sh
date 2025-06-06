#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/BAT0"
LOW_BATTERY_THRESHOLD=10

while true; do
    if [[ -f "$BATTERY_PATH/capacity" && -f "$BATTERY_PATH/status" ]]; then
        capacity=$(<"$BATTERY_PATH/capacity")
        status=$(<"$BATTERY_PATH/status")

        if [[ "$status" == "Discharging" && "$capacity" -le $LOW_BATTERY_THRESHOLD ]]; then
            echo "Bateria abaixo de ${LOW_BATTERY_THRESHOLD}%, desligando..."

            # Notifica apenas se os comandos existirem
            command -v notify-send >/dev/null && notify-send "⚠️ Bateria crítica!" "O sistema será desligado em 30 segundos..."
            command -v wall >/dev/null && wall "⚠️ Bateria crítica! Desligando em 30 segundos..."

            sleep 30
            systemctl poweroff
            exit 0
        fi
    fi

    sleep 60
done
