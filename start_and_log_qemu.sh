#!/bin/sh -x
#Authhor: zzz0072

if [ -z "$1" -o -z "$2" ] ; then
   exit
fi 

#Make sure there are only one qemu
pkill -9 qemu-system-arm

#clean up log
rm -f $2
rm -f $3

$1 -nographic -M stm32-p103 -gdb tcp::3333 -S -kernel main.bin -monitor null \
-serial file:$2
