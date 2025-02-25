#!/bin/sh

set -xe

qemu-img create -f qcow2 "$2" 4G

qemu-system-x86_64 -accel hvf -vga std \
                   -m 2048 -smp 2 -cpu host \
                   -soundhw ac97 \
                   -net nic,model=e1000 -net user \
                   -cdrom "$1" \
                   -hda "$2" \
                   -boot d \
                   -monitor stdio
