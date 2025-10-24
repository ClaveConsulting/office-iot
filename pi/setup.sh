#!/usr/bin/env bash
set -xe

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
OUTPUT_DIR="$HOME/office-iot-output"
mkdir -p "$OUTPUT_DIR"
echo "hello $TIMESTAMP" >> "$OUTPUT_DIR/output.txt"

