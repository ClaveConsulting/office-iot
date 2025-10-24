#!/usr/bin/env bash
set -xe

mkdir -p $HOME/office-iot-output/data
docker compose up --detach 
