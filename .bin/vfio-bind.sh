#!/bin/bash
set -e

DEVICES=("0000:01:00.0" "0000:01:00.1")

echo "Unbinding NVIDIA drivers..."
for dev in "${DEVICES[@]}"; do
    if [ -e /sys/bus/pci/devices/$dev/driver ]; then
        echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
    fi
done

echo "Loading vfio-pci..."
modprobe vfio-pci

echo "Binding to vfio-pci..."
for dev in "${DEVICES[@]}"; do
    echo $dev > /sys/bus/pci/drivers/vfio-pci/bind
done

echo "Done. GPU handed to vfio-pci."
