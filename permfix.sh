#!/bin/bash
#
#  permfix.sh
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

allfiles=$(find $HOME)
for file in $allfiles
do
   curr="$HOME/$file"
   if [ -d "$curr" ]; then
      chmod -R 700 "$curr"
   elif [ -f "$curr" ]; then
      chmod 600 "$curr"
   fi
done

chmod -R 700 "$HOME/bin"
chmod -R 700 "$HOME/devel"

tmpfile=/tmp/mychmod.tmp
ls -Ab $HOME | grep -v '\.' | grep -Ev 'devel|bin' > $tmpfile
while read line
do
   curr="$HOME/$line"
   chmod -R 750 "$curr"
done < $tmpfile

rm -fr $tmpfile
exit


