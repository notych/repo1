#!/bin/bash

cd ~/linux_p2
mkdir -p backup old_backup log

for file in backup/*; do
    if [ -f "$file" ]; then
        if [ $(( $(date +%s) - $(stat -c %Y "$file") )) -gt 1 ]; then
            mv "$file" "old_backup/$(basename "$file")"
        fi
    fi
done

for file in *; do
    if [ -f "$file" ]; then
        echo "$file"
        tar -czf "backup/${file}_$(date +%Y-%m-%d).tar.gz" "$file"
    fi
done

