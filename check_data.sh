#!/bin/sh
#Origin Author:zzz0072

#Check data exist
if [ $# != 2] ; then
#    echo $0 QEMU_LOG GDB_LOG
    exit
fi

#No need qemu anymore
pkill -9 qemu-system-arm
sleep 1
#Chech the data is correct or not
echo "\nDate check result: "
diff $1 $2
if [ $? != 0 ] ; then
    echo "Sent data"
    cat $2
    echo "is different with via UART output data"
    cat $1
    exit
fi

echo "Sent data via UART is correct!"
