#!/usr/bin/env bash

# 1. Get absolute path of pull.sh in the same directory of this file
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PULL_SCRIPT_PATH="$SCRIPT_DIR/pull.sh"
# 2. Set up a job that runs pull.sh every minute using systemd
JOB_DIR="$HOME/.config/systemd/user"
mkdir -p "$JOB_DIR"
SERVICE_FILE="$JOB_DIR/office-iot-pull.service"
TIMER_FILE="$JOB_DIR/office-iot-pull.timer"

cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Run pull.sh

[Service]
Type=oneshot
WorkingDirectory=$SCRIPT_DIR
ExecStart=$PULL_SCRIPT_PATH
EOF

cat <<EOF > "$TIMER_FILE"
[Unit]
Description=Run office-iot-pull.service every minute

[Timer]
OnUnitActiveSec=1min
Unit=office-iot-pull.service

[Install]
WantedBy=timers.target
EOF

chmod +x "$SERVICE_FILE"
chmod +x "$TIMER_FILE"

systemctl --user enable --now "$SERVICE_FILE"
systemctl --user enable --now "$TIMER_FILE"
