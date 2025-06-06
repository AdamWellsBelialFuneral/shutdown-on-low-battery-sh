Shutdown Linux when battery is 10% and use notify-send and wall to notify

1. sudo chmod +x /usr/local/bin/shutdown_on_low_battery.sh

2. put lowbattery.service in /etc/systemd/system/lowbattery.service

4. sudo systemctl daemon-reload
5. sudo systemctl enable --now lowbattery.service
