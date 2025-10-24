#!/usr/bin/env bash

pwd
# 1. Pull latest main of this repo
git pull origin main
# 2. Read latest commit hash
LATEST_COMMIT_HASH=$(git rev-parse HEAD)
# 3. Read commit hash that has been setup from a file
STORED_COMMIT_HASH_FILE=".setup_commit_hash"
if [ -f "$STORED_COMMIT_HASH_FILE" ]; then
    STORED_COMMIT_HASH=$(cat "$STORED_COMMIT_HASH_FILE")
else
    STORED_COMMIT_HASH=""
fi
# 4. If they differ, run setup.sh and write latest commit hash to file
if [ "$LATEST_COMMIT_HASH" != "$STORED_COMMIT_HASH" ]; then
    ./setup.sh
    echo "$LATEST_COMMIT_HASH" > "$STORED_COMMIT_HASH_FILE"
fi
