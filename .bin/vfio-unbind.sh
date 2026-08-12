#!/bin/bash
set -e

DEVICES=("0000:01:00.0" "0000:01:00.1")

echo "Unbinding from vfio-pci..."
for dev in "${DEVICES[@]}"; do
    if [ -e /sys/bus/pci/devices/$dev/driver ]; then
        echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
    fi
done

echo "Reloading NVIDIA drivers..."
modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_drm
modprobe nvidia_uvm

echo "Done. GPU returned to host."
