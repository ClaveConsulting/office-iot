#!/usr/bin/env bash
set -xe

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
OUTPUT_DIR="$HOME/office-iot-output"
echo "hello $TIMESTAMP" >> "$OUTPUT_DIR/output.txt"

