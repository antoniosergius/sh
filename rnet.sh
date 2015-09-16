#!/bin/bash
#  rnet.sh
#
#  Copyright 2015 Antônio Sérgio Garcia Ferreira <serginho@serginho-desktop>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.


if [ $(id -u) -ne 0 ]; then
   echo "rnet.sh: Operação não permitida. Execute como root."
   exit
fi

# Para que os comando ifdown e ifup funcionem é preciso que os 
# arquivos de configuração de rede (/etc/network/interfaces) estejam
# corretamente configurados. 

tmpfile=/tmp/netfix.tmp
ifquery -l > $tmpfile

while read dev
do
   if [ "$dev" == "lo" ]; then
      continue
   fi
   echo "rnet.sh: Reiniciando $dev..."
   ifdown "$dev" > /dev/null 2>&1
   ifup "$dev" > /dev/null 2>&1
done < $tmpfile

rm -fr $tmpfile
echo "rnet.sh: Sucesso."
exit