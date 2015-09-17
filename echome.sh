#!/bin/bash
#
#  echome.sh
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
#
#  2015/09/16 22:31:32
#
# ---
#
# Imprime informações para cabeçalhos de arquivos de desenvolvimento.
#
function print_usage {
    echo "Uso: echome.sh [OPÇÃO]"
    echo "Imprime informações do usuário para que seja usada em arquivos como"
    echo "README, LICENSE ou o cabeçalho de um arquivo de desenvolvimento de "
    echo "programas."
    echo ""
    echo "   -h, --help         mostra esta mensagem "
    echo "   -c, --header       imprime o cabeçalho "
    echo "   -l, --license      imprime licença GNU GPL v2"
    echo "   -r, --readme       imprime formato de um arquivo README"
    echo ""
    echo "Exemplos:"
    echo "   echome.sh -h"
    echo "   echome.sh -l"
    exit 0
}

function print_header {
   echo "#!/bin/bash"
   echo "#"
   echo "#  script.sh"
   echo "#"
   echo "#  Copyright $(date +%Y) $(cat /etc/passwd | grep $USER | cut -d: -f5| cut -d, -f1) <antoniosergio@mail.com>"
   echo "#"
   echo "#  This program is free software; you can redistribute it and/or modify"
   echo "#  it under the terms of the GNU General Public License as published by"
   echo "#  the Free Software Foundation; either version 2 of the License, or"
   echo "#  (at your option) any later version."
   echo "#"
   echo "#  This program is distributed in the hope that it will be useful,"
   echo "#  but WITHOUT ANY WARRANTY; without even the implied warranty of"
   echo "#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
   echo "#  GNU General Public License for more details."
   echo "#"
   echo "#  You should have received a copy of the GNU General Public License"
   echo "#  along with this program; if not, write to the Free Software"
   echo "#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,"
   echo "#  MA 02110-1301, USA."
   echo "#"
   echo "#  $(date +%Y/%m/%d\ %H:%M:%S)"
   echo "#"
   echo "# ---"
   echo "#"
   exit 0
}

function print_readme {
   echo "#"
   echo "# repository - https://github.com/antoniosergius/repository.git"
   echo "#"
   echo "# Repositório público. Mais informações sobre o projeto."
   echo "# Autor: $(cat /etc/passwd | grep $USER | cut -d: -f5| cut -d, -f1) <antoniosergio@mail.com>"
   echo "#"
   echo "#  $(date +%Y/%m/%d\ %H:%M:%S)"
   echo "#"
}

function print_license {
   /bin/bash /home/serginho/devel/sh/printgpl2.sh
}

if [ $# -gt 0 ]; then
   while [ "${1+defined}" ]; do
      case "$1" in
         -h | --help)
            print_usage
            ;;
         -c | --header)
            print_header
            ;;
         -l | --licence)
            print_licence
            ;;
         -r | --readme)
            print_readme
          *)
            print_usage
      esac
   done
else
   print_usage
fi



