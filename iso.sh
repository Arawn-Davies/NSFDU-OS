#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp kernel isodir/boot/aoyu.kernel
cp initrd.img isodir/boot/initrd.img
cat > isodir/boot/grub/grub.cfg << EOF
set timeout=2
set default=0

menuentry "Aoyu" {
	multiboot /boot/aoyu.kernel
	module /boot/initrd.img
	sleep 2
}
EOF
grub-mkrescue -o aoyu.iso isodir
