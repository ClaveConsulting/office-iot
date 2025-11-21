#!/usr/bin/env bash
set -xe

mkdir -p $HOME/office-iot-output/zigbee2mqtt/data
mkdir -p $HOME/office-iot-output/eclipse-mosquitto/data
cp ./zigbee2mqtt/* $HOME/office-iot-output/zigbee2mqtt/data

docker compose up --detach 
