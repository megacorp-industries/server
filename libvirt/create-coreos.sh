#!/bin/sh

IGN_CONFIG=/var/lib/libvirt/images/config.ign
IMAGE=/var/lib/libvirt/images/coreos.qcow2
VM_NAME=worker$1
VCPUS=2
RAM_MB=4096
DISK_GB=30
STREAM=stable

chcon -t virt_image_t /var/lib/libvirt/images/config.ign
virt-install --connect="qemu:///system" --name="${VM_NAME}" \
    --vcpus="${VCPUS}" --memory="${RAM_MB}" \
    --os-variant="fedora-coreos-$STREAM" --import --graphics=none \
    --disk="size=${DISK_GB},backing_store=${IMAGE}" \
    --qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${IGN_CONFIG}"
