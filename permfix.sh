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
#
#  --
#
#  Altera a permissão dos arquivos e diretórios não ocultos do $HOME.
#  As permissões do sistema geralmente vem padronizadas no format 755 ou 644
#  dependendo do tipo de arquivo. Esse script remove a terceira permissão
#  (outros) do octal XXX, as atualizando para zero. Isso faz com que apenas
#  o dono e membros do grupo possa acessar os arquivos.
#
#  Algumas pastas são específicas do meu sistema. Caso queira usar este script
#  altere para melhor satisfazê-lo.
#

function print_usage {
    echo "Uso: permfix [OPÇÃO] [DIRETÓRIO]"
    echo 'Altera a permissão dos arquivos e diretórios não ocultos de DIRETÓRIO.'
    echo "Sem argumentos o programa entende DIRETÓRIO como \$HOME"
    echo ""
    echo "   -h, --help       mostra esta mensagem "
    echo "   -v, --verbose    imprime na tela as modificações"
    echo ""
    echo "Exemplos:"
    echo "   permfix -v"
    echo "   permfix /home/serginho"
    echo "   permfix --help"
    exit 0
}

prefix="chmod"
if [ $# -gt 0 ]; then
   while [ "${1+defined}" ]; do
      case "$1" in
         -h | --help)
            print_usage
            ;;
         -v | --verbose)
            prefix="chmod -v"
            shift
            ;;
          *)
            dir="$1"
            if [ ! -d "$dir" ]; then
               print_usage
            fi
            shift
      esac
   done
fi
if [ -z "$dir" ]; then
   $dir="$HOME"
fi

# A opção -print0 imprime o nome do arquivo seguido de um caracter nulo.
# Em seguida read lê a entrada usando o caracter nulo como delimitador.
find "$dir" -print0 | while read -d $'\0' file
do
   case "$file" in
      #não faz nada se casar com os seguintes padrões
      $HOME/.*|$HOME/bin*|*.git*)
      ;;

      #Se for diretório coloca o bit de execução
      *) mod=640
         if [ -d "$file" ]; then
            mod=750
         fi
         command $prefix $mod "$file"
      ;;
   esac
done
exit 0
