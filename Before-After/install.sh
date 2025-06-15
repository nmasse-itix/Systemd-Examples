#!/bin/bash

set -Eeuo pipefail

. common.env

for unit in "${UNITS[@]}"; do
  echo "Installing $unit..."
  sudo cp -r --preserve=mode "$unit" "/etc/systemd/system/$unit"
done

echo "Reloading systemd..."
sudo systemctl daemon-reload

for unit in "${UNITS[@]}"; do
  if grep -Fqx '[Install]' "$unit"; then
    echo "Installing $unit..."
    sudo systemctl enable "$unit"
  fi
done
