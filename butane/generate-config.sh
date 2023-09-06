#!/bin/bash
#
# Generate butane config
podman run --interactive --rm --security-opt label=disable \
       --volume ${PWD}:/pwd --workdir /pwd quay.io/coreos/butane:release \
       --pretty --strict config.bu > /var/lib/libvirt/images/config.ign

# Fix permissions on ignition file
chown root:root /var/lib/libvirt/images/config.ign
