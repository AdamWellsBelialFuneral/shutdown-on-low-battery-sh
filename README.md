Shutdown Linux when battery reaches 10%, using notify-send and wall for notifications if available

DETAILS: By default, the script monitors battery BAT0. Verify with ls /sys/class/power_supply/.

1. Make the script executable:

sudo chmod +x /usr/local/bin/shutdown_on_low_battery.sh

2. Place lowbattery.service in /etc/systemd/system/lowbattery.service

3. Reload systemd daemon:

sudo systemctl daemon-reload

4. Enable and start the service:

sudo systemctl enable --now lowbattery.service
