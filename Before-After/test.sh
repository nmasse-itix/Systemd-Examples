#!/bin/bash

set -Eeuo pipefail

. common.env

sudo systemctl stop mnt-test.mount
sudo systemctl stop mnt-backup.mount

sudo rm -f /mnt/test/witness /mnt/backup/mnt-test.tar
sudo mkdir -p /mnt/test /mnt/backup
echo "Hello, World!" | sudo tee /mnt/test/witness > /dev/null

( sleep 1 ; sudo systemctl start custom.target ) &

declare -a journalctl_args=()
for unit in "${UNITS[@]}"; do
  journalctl_args+=( -u "$unit" )
done
sudo journalctl --since=now "${journalctl_args[@]}" -f
