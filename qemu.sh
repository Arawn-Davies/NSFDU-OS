#!/bin/sh
set -e
. ./iso.sh
qemu-system-i386 -cdrom aoyu.iso -monitor stdio
./clean.sh
