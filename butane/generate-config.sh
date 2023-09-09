#!/bin/bash

# Generate butane config
podman run --interactive --rm --security-opt label=disable \
       --volume ${PWD}:/pwd --workdir /pwd quay.io/coreos/butane:release \
       --pretty --strict config.bu > config.ign

# Fix permissions on ignition file
chown root:root config.ign

#  Move generated ignition config to libvirt images dir
mv config.ign /var/lib/libvirt/images
