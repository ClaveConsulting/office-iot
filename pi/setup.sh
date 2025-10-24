#!/usr/bin/env bash
set -xe

USB_NAME="usb-1a86_USB_Serial-if00-port0"
docker run \
   --name zigbee2mqtt \
   --restart=unless-stopped \
   --device="/dev/serial/by-id/$USB_NAME:/dev/ttyACM0" \
   -p 8080:8080 \
   -v $(pwd)/data:/app/data \
   -v /run/udev:/run/udev:ro \
   -e TZ=Europe/Amsterdam \
   -d \
   ghcr.io/koenkk/zigbee2mqtt

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
OUTPUT_DIR="$HOME/office-iot-output"
echo "setup ran at $TIMESTAMP" >> "$OUTPUT_DIR/output.txt"
