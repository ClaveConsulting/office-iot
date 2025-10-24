#!/usr/bin/env bash
set -xe

pwd
OUTPUT_DIR="$HOME/office-iot-output"
mkdir -p $OUTPUT_DIR

# Create a filename friendly timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# 1. Pull latest main of this repo
git pull origin main
# 2. Read latest commit hash
LATEST_COMMIT_HASH=$(git rev-parse HEAD)
# 3. Read commit hash that has been setup from a file
STORED_COMMIT_HASH_FILE="$OUTPUT_DIR/.setup_commit_hash"
if [ -f "$STORED_COMMIT_HASH_FILE" ]; then
    STORED_COMMIT_HASH=$(cat "$STORED_COMMIT_HASH_FILE")
else
    STORED_COMMIT_HASH=""
fi
# 4. If they differ, run setup.sh and write latest commit hash to file
if [ "$LATEST_COMMIT_HASH" != "$STORED_COMMIT_HASH" ]; then
    # Run setup.sh but ignore errors
    echo "running setup.sh"
    OUTPUT_FILE="$OUTPUT_DIR/output.$TIMESTAMP.log"
    (./setup.sh || true) > $OUTPUT_FILE 2>&1
    echo "$LATEST_COMMIT_HASH" > "$STORED_COMMIT_HASH_FILE"
fi
