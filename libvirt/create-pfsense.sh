#!/bin/bash

ISO=/var/lib/libvirt/images/pfsense.iso
VM_NAME=pfsense$1
VCPUS=2
RAM_MB=4096

sudo qemu-img create -f qcow2 /var/lib/libvirt/images/pfsense.qcow2 10G

virt-install --virt-type kvm \           
    --name ${VM_NAME} --ram ${RAM_MB} --vcpus ${VCPUS} \
    --cdrom=/var/lib/libvirt/images/pfsense.iso \
    --network default \
    --network bridge=br0 \
    --graphics vnc,listen=0.0.0.0 --noautoconsole \
    --os-variant=freebsd13.1 \
    --disk /var/lib/libvirt/images/pfsense.qcow2,bus=virtio,size=10,format=qcow2
