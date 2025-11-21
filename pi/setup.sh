#!/usr/bin/env bash
set -xe

mkdir -p $HOME/office-iot-output/zigbee2mqtt/data
mkdir -p $HOME/office-iot-output/eclipse-mosquitto/data
mkdir -p $HOME/office-iot-output/eclipse-mosquitto/config
mkdir -p $HOME/office-iot-output/eclipse-mosquitto/log
cp ./zigbee2mqtt/* $HOME/office-iot-output/zigbee2mqtt/data
cp ./eclipse-mosquitto/config/* $HOME/office-iot-output/eclipse-mosquitto/config

docker compose up --detach 
