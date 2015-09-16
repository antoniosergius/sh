#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "netfix: Operação não permitida. Execute como root."
    exit
fi

echo "netfix: Reiniciando interfaces de rede...."

tmpfile=/tmp/netfix.tmp
netstat -i | cut -d' ' -f1 > $tmpfile
sed -i 1,2d $tmpfile

while read dev
do
   if [ "$dev" == "lo" ]; then
      continue   
   fi
   
   ifconfig down "$dev" && ifconfig up "$dev"
   echo "netfix: $dev"
done < $tmpfile

rm -fr $tmpfile
exit
