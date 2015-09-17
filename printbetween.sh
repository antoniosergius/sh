#!/bin/bash
#
#  printbetween.sh
#
#  Copyright 2015 Antônio Sérgio Garcia Ferreira <antoniosergio@mail.com>
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
#
#  --
#
#  2015/09/17 01:05:35
#
#  Pega o conteúdo de um arquivo e transforma cada linha um script usando o
#  comando echo. Ex: echo "conteúdo da linha 1"
#                    echo "conteúdo da linha 2"
#

function print_usage {
    echo "Uso: printbetween.sh ARQUIVO"
    echo "Coloca o comando echo entre cada linha do arquivo."
    echo ""
    echo "   -h, --help       mostra esta mensagem "
    exit 0
}

if [ $# -gt 0 ]; then
   while [ "${1+defined}" ]; do
      case "$1" in
         -h | --help)
            print_usage
            ;;
         *)
            if [ -f "$file" ] && [ -s "$file" ]; then
               while read line;
               do
                   echo "echo \"$line\""
               done < "$1"
               exit 0
            fi
      esac
   done
else
   print_usage
fi

