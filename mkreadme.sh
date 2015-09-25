#!/bin/bash
#
#  mkreadme.sh
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
#  ---
#
#  Imprime informações para cabeçalhos de arquivos de desenvolvimento.
#

function print_usage {
    echo "Uso: mkreadme.sh [OPÇÃO | --all DIRETÓRIO]"
    echo "Imprime informações do usuário para que seja usada em arquivos como"
    echo "README, LICENSE ou o cabeçalho de um arquivo de desenvolvimento de "
    echo "programas."
    echo "   -?, --help         mostra esta mensagem "
    echo "   -h, --header       imprime o cabeçalho "
    echo "   -l, --license      imprime licença GNU GPL v2"
    echo "   -r, --readme       imprime formato de um arquivo README"
    echo "   -a, --all DIR      imprime licença e readme em um diretório"
    echo "   -d, --date         imprime data no formato %Y/%m/%d %H:%M:%S"
    exit 0
}

function print_header {
   project="script"
   if [ "${1+defined}" ]; then
      project="$1"
   fi
   echo -e "#!/bin/bash\n#\n#  $project.sh\n#"
   echo -e "#  Copyright $(date +%Y) $(cat /etc/passwd | grep $USER | cut -d: -f5| cut -d, -f1) <antoniosergio@mail.com>\n#"
   echo "#  This program is free software; you can redistribute it and/or modify"
   echo "#  it under the terms of the GNU General Public License as published by"
   echo "#  the Free Software Foundation; either version 2 of the License, or"
   echo -e "#  (at your option) any later version.\n#"
   echo "#  This program is distributed in the hope that it will be useful,"
   echo "#  but WITHOUT ANY WARRANTY; without even the implied warranty of"
   echo "#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
   echo -e "#  GNU General Public License for more details.\n#"
   echo "#  You should have received a copy of the GNU General Public License"
   echo "#  along with this program; if not, write to the Free Software"
   echo "#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,"
   echo -e "#  MA 02110-1301, USA.\n#"
   echo -e "#  $(date +%Y/%m/%d\ %H:%M:%S)\n#\n#  ---\n#"
}

function print_readme {
   echo -e "## Synopsis\n"
   echo "Repository - https://github.com/antoniosergius/repository.git"
   echo "At the top of the file there should be a short introduction and/ or"
   echo "overview that explains **what** the project is. This description should"
   echo "match descriptions added for package managers (Gemspec, package.json, etc.)"
   echo "Author: $(cat /etc/passwd | grep $USER | cut -d: -f5| cut -d, -f1) - antoniosergio@mail.com"
   echo -e "Date  : $(date +%Y/%m/%d\ %H:%M:%S)\n\n## Code Example\n"
   echo "Show what the library does as concisely as possible, developers should"
   echo "be able to figure out **how** your project solves their problem by"
   echo "looking at the code example. Make sure the API you are showing off"
   echo -e "is obvious, and that your code is short and concise.\n\n## Motivation\n"
   echo "A short description of the motivation behind the creation and maintenance"
   echo -e "of the project. This should explain **why** the project exists.\n\n## Installation\n"
   echo -e "Provide code examples and explanations of how to get the project.\n\n## API Reference\n"
   echo -e "Depending on the size of the project, if it is small and simple enough"
   echo "the reference docs can be added to the README. For medium size to"
   echo "larger projects it is important to at least provide a link to where"
   echo -e "the API reference docs live.\n\n## Tests\n"
   echo -e "Describe and show how to run the tests with code examples.\n\n## Contributors\n"
   echo "Let people know how they can dive into the project, include important"
   echo -e "links to things like issue trackers, irc, twitter accounts if applicable.\n"
   echo -e "## License\n\nA short snippet describing the license (MIT, Apache, etc.)\n"
}

function print_license {
   echo "                    GNU GENERAL PUBLIC LICENSE"
   echo "                       Version 2, June 1991"
   echo ""
   echo " Copyright (C) 1989, 1991 Free Software Foundation, Inc., <http://fsf.org/>"
   echo " 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA"
   echo " Everyone is permitted to copy and distribute verbatim copies"
   echo " of this license document, but changing it is not allowed."
   echo ""
   echo "                            Preamble"
   echo ""
   echo "  The licenses for most software are designed to take away your"
   echo "freedom to share and change it.  By contrast, the GNU General Public"
   echo "License is intended to guarantee your freedom to share and change free"
   echo "software--to make sure the software is free for all its users.  This"
   echo "General Public License applies to most of the Free Software"
   echo "Foundation's software and to any other program whose authors commit to"
   echo "using it.  (Some other Free Software Foundation software is covered by"
   echo "the GNU Lesser General Public License instead.)  You can apply it to"
   echo "your programs, too."
   echo ""
   echo "  When we speak of free software, we are referring to freedom, not"
   echo "price.  Our General Public Licenses are designed to make sure that you"
   echo "have the freedom to distribute copies of free software (and charge for"
   echo "this service if you wish), that you receive source code or can get it"
   echo "if you want it, that you can change the software or use pieces of it"
   echo "in new free programs; and that you know you can do these things."
   echo ""
   echo "  To protect your rights, we need to make restrictions that forbid"
   echo "anyone to deny you these rights or to ask you to surrender the rights."
   echo "These restrictions translate to certain responsibilities for you if you"
   echo "distribute copies of the software, or if you modify it."
   echo ""
   echo "  For example, if you distribute copies of such a program, whether"
   echo "gratis or for a fee, you must give the recipients all the rights that"
   echo "you have.  You must make sure that they, too, receive or can get the"
   echo "source code.  And you must show them these terms so they know their"
   echo "rights."
   echo ""
   echo "  We protect your rights with two steps: (1) copyright the software, and"
   echo "(2) offer you this license which gives you legal permission to copy,"
   echo "distribute and/or modify the software."
   echo ""
   echo "  Also, for each author's protection and ours, we want to make certain"
   echo "that everyone understands that there is no warranty for this free"
   echo "software.  If the software is modified by someone else and passed on, we"
   echo "want its recipients to know that what they have is not the original, so"
   echo "that any problems introduced by others will not reflect on the original"
   echo "authors' reputations."
   echo ""
   echo "  Finally, any free program is threatened constantly by software"
   echo "patents.  We wish to avoid the danger that redistributors of a free"
   echo "program will individually obtain patent licenses, in effect making the"
   echo "program proprietary.  To prevent this, we have made it clear that any"
   echo "patent must be licensed for everyone's free use or not licensed at all."
   echo ""
   echo "  The precise terms and conditions for copying, distribution and"
   echo "modification follow."
   echo ""
   echo "                    GNU GENERAL PUBLIC LICENSE"
   echo "   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION"
   echo ""
   echo "  0. This License applies to any program or other work which contains"
   echo "a notice placed by the copyright holder saying it may be distributed"
   echo "under the terms of this General Public License.  The \"Program\", below,"
   echo "refers to any such program or work, and a \"work based on the Program\""
   echo "means either the Program or any derivative work under copyright law:"
   echo "that is to say, a work containing the Program or a portion of it,"
   echo "either verbatim or with modifications and/or translated into another"
   echo "language.  (Hereinafter, translation is included without limitation in"
   echo "the term \"modification\".)  Each licensee is addressed as \"you\"."
   echo ""
   echo "Activities other than copying, distribution and modification are not"
   echo "covered by this License; they are outside its scope.  The act of"
   echo "running the Program is not restricted, and the output from the Program"
   echo "is covered only if its contents constitute a work based on the"
   echo "Program (independent of having been made by running the Program)."
   echo "Whether that is true depends on what the Program does."
   echo ""
   echo "  1. You may copy and distribute verbatim copies of the Program's"
   echo "source code as you receive it, in any medium, provided that you"
   echo "conspicuously and appropriately publish on each copy an appropriate"
   echo "copyright notice and disclaimer of warranty; keep intact all the"
   echo "notices that refer to this License and to the absence of any warranty;"
   echo "and give any other recipients of the Program a copy of this License"
   echo "along with the Program."
   echo ""
   echo "You may charge a fee for the physical act of transferring a copy, and"
   echo "you may at your option offer warranty protection in exchange for a fee."
   echo ""
   echo "  2. You may modify your copy or copies of the Program or any portion"
   echo "of it, thus forming a work based on the Program, and copy and"
   echo "distribute such modifications or work under the terms of Section 1"
   echo "above, provided that you also meet all of these conditions:"
   echo ""
   echo "    a) You must cause the modified files to carry prominent notices"
   echo "    stating that you changed the files and the date of any change."
   echo ""
   echo "    b) You must cause any work that you distribute or publish, that in"
   echo "    whole or in part contains or is derived from the Program or any"
   echo "    part thereof, to be licensed as a whole at no charge to all third"
   echo "    parties under the terms of this License."
   echo ""
   echo "    c) If the modified program normally reads commands interactively"
   echo "    when run, you must cause it, when started running for such"
   echo "    interactive use in the most ordinary way, to print or display an"
   echo "    announcement including an appropriate copyright notice and a"
   echo "    notice that there is no warranty (or else, saying that you provide"
   echo "    a warranty) and that users may redistribute the program under"
   echo "    these conditions, and telling the user how to view a copy of this"
   echo "    License.  (Exception: if the Program itself is interactive but"
   echo "    does not normally print such an announcement, your work based on"
   echo "    the Program is not required to print an announcement.)"
   echo ""
   echo "These requirements apply to the modified work as a whole.  If"
   echo "identifiable sections of that work are not derived from the Program,"
   echo "and can be reasonably considered independent and separate works in"
   echo "themselves, then this License, and its terms, do not apply to those"
   echo "sections when you distribute them as separate works.  But when you"
   echo "distribute the same sections as part of a whole which is a work based"
   echo "on the Program, the distribution of the whole must be on the terms of"
   echo "this License, whose permissions for other licensees extend to the"
   echo "entire whole, and thus to each and every part regardless of who wrote it."
   echo ""
   echo "Thus, it is not the intent of this section to claim rights or contest"
   echo "your rights to work written entirely by you; rather, the intent is to"
   echo "exercise the right to control the distribution of derivative or"
   echo "collective works based on the Program."
   echo ""
   echo "In addition, mere aggregation of another work not based on the Program"
   echo "with the Program (or with a work based on the Program) on a volume of"
   echo "a storage or distribution medium does not bring the other work under"
   echo "the scope of this License."
   echo ""
   echo "  3. You may copy and distribute the Program (or a work based on it,"
   echo "under Section 2) in object code or executable form under the terms of"
   echo "Sections 1 and 2 above provided that you also do one of the following:"
   echo ""
   echo "    a) Accompany it with the complete corresponding machine-readable"
   echo "    source code, which must be distributed under the terms of Sections"
   echo "    1 and 2 above on a medium customarily used for software interchange; or,"
   echo ""
   echo "    b) Accompany it with a written offer, valid for at least three"
   echo "    years, to give any third party, for a charge no more than your"
   echo "    cost of physically performing source distribution, a complete"
   echo "    machine-readable copy of the corresponding source code, to be"
   echo "    distributed under the terms of Sections 1 and 2 above on a medium"
   echo "    customarily used for software interchange; or,"
   echo ""
   echo "    c) Accompany it with the information you received as to the offer"
   echo "    to distribute corresponding source code.  (This alternative is"
   echo "    allowed only for noncommercial distribution and only if you"
   echo "    received the program in object code or executable form with such"
   echo "    an offer, in accord with Subsection b above.)"
   echo ""
   echo "The source code for a work means the preferred form of the work for"
   echo "making modifications to it.  For an executable work, complete source"
   echo "code means all the source code for all modules it contains, plus any"
   echo "associated interface definition files, plus the scripts used to"
   echo "control compilation and installation of the executable.  However, as a"
   echo "special exception, the source code distributed need not include"
   echo "anything that is normally distributed (in either source or binary"
   echo "form) with the major components (compiler, kernel, and so on) of the"
   echo "operating system on which the executable runs, unless that component"
   echo "itself accompanies the executable."
   echo ""
   echo "If distribution of executable or object code is made by offering"
   echo "access to copy from a designated place, then offering equivalent"
   echo "access to copy the source code from the same place counts as"
   echo "distribution of the source code, even though third parties are not"
   echo "compelled to copy the source along with the object code."
   echo ""
   echo "  4. You may not copy, modify, sublicense, or distribute the Program"
   echo "except as expressly provided under this License.  Any attempt"
   echo "otherwise to copy, modify, sublicense or distribute the Program is"
   echo "void, and will automatically terminate your rights under this License."
   echo "However, parties who have received copies, or rights, from you under"
   echo "this License will not have their licenses terminated so long as such"
   echo "parties remain in full compliance."
   echo ""
   echo "  5. You are not required to accept this License, since you have not"
   echo "signed it.  However, nothing else grants you permission to modify or"
   echo "distribute the Program or its derivative works.  These actions are"
   echo "prohibited by law if you do not accept this License.  Therefore, by"
   echo "modifying or distributing the Program (or any work based on the"
   echo "Program), you indicate your acceptance of this License to do so, and"
   echo "all its terms and conditions for copying, distributing or modifying"
   echo "the Program or works based on it."
   echo ""
   echo "  6. Each time you redistribute the Program (or any work based on the"
   echo "Program), the recipient automatically receives a license from the"
   echo "original licensor to copy, distribute or modify the Program subject to"
   echo "these terms and conditions.  You may not impose any further"
   echo "restrictions on the recipients' exercise of the rights granted herein."
   echo "You are not responsible for enforcing compliance by third parties to"
   echo "this License."
   echo ""
   echo "  7. If, as a consequence of a court judgment or allegation of patent"
   echo "infringement or for any other reason (not limited to patent issues),"
   echo "conditions are imposed on you (whether by court order, agreement or"
   echo "otherwise) that contradict the conditions of this License, they do not"
   echo "excuse you from the conditions of this License.  If you cannot"
   echo "distribute so as to satisfy simultaneously your obligations under this"
   echo "License and any other pertinent obligations, then as a consequence you"
   echo "may not distribute the Program at all.  For example, if a patent"
   echo "license would not permit royalty-free redistribution of the Program by"
   echo "all those who receive copies directly or indirectly through you, then"
   echo "the only way you could satisfy both it and this License would be to"
   echo "refrain entirely from distribution of the Program."
   echo ""
   echo "If any portion of this section is held invalid or unenforceable under"
   echo "any particular circumstance, the balance of the section is intended to"
   echo "apply and the section as a whole is intended to apply in other"
   echo "circumstances."
   echo ""
   echo "It is not the purpose of this section to induce you to infringe any"
   echo "patents or other property right claims or to contest validity of any"
   echo "such claims; this section has the sole purpose of protecting the"
   echo "integrity of the free software distribution system, which is"
   echo "implemented by public license practices.  Many people have made"
   echo "generous contributions to the wide range of software distributed"
   echo "through that system in reliance on consistent application of that"
   echo "system; it is up to the author/donor to decide if he or she is willing"
   echo "to distribute software through any other system and a licensee cannot"
   echo "impose that choice."
   echo ""
   echo "This section is intended to make thoroughly clear what is believed to"
   echo "be a consequence of the rest of this License."
   echo ""
   echo "  8. If the distribution and/or use of the Program is restricted in"
   echo "certain countries either by patents or by copyrighted interfaces, the"
   echo "original copyright holder who places the Program under this License"
   echo "may add an explicit geographical distribution limitation excluding"
   echo "those countries, so that distribution is permitted only in or among"
   echo "countries not thus excluded.  In such case, this License incorporates"
   echo "the limitation as if written in the body of this License."
   echo ""
   echo "  9. The Free Software Foundation may publish revised and/or new versions"
   echo "of the General Public License from time to time.  Such new versions will"
   echo "be similar in spirit to the present version, but may differ in detail to"
   echo "address new problems or concerns."
   echo ""
   echo "Each version is given a distinguishing version number.  If the Program"
   echo "specifies a version number of this License which applies to it and \"any\""
   echo "\"later version\", you have the option of following the terms and conditions"
   echo "either of that version or of any later version published by the Free"
   echo "Software Foundation.  If the Program does not specify a version number of"
   echo "this License, you may choose any version ever published by the Free Software"
   echo "Foundation."
   echo ""
   echo "  10. If you wish to incorporate parts of the Program into other free"
   echo "programs whose distribution conditions are different, write to the author"
   echo "to ask for permission.  For software which is copyrighted by the Free"
   echo "Software Foundation, write to the Free Software Foundation; we sometimes"
   echo "make exceptions for this.  Our decision will be guided by the two goals"
   echo "of preserving the free status of all derivatives of our free software and"
   echo "of promoting the sharing and reuse of software generally."
   echo ""
   echo "                            NO WARRANTY"
   echo ""
   echo "  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY"
   echo "FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN"
   echo "OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES"
   echo "PROVIDE THE PROGRAM \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED"
   echo "OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF"
   echo "MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS"
   echo "TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE"
   echo "PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,"
   echo "REPAIR OR CORRECTION."
   echo ""
   echo "  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING"
   echo "WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR"
   echo "REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,"
   echo "INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING"
   echo "OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED"
   echo "TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY"
   echo "YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER"
   echo "PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE"
   echo "POSSIBILITY OF SUCH DAMAGES."
   echo ""
   echo "                     END OF TERMS AND CONDITIONS"
   echo ""
   echo "            How to Apply These Terms to Your New Programs"
   echo ""
   echo "  If you develop a new program, and you want it to be of the greatest"
   echo "possible use to the public, the best way to achieve this is to make it"
   echo "free software which everyone can redistribute and change under these terms."
   echo ""
   echo "  To do so, attach the following notices to the program.  It is safest"
   echo "to attach them to the start of each source file to most effectively"
   echo "convey the exclusion of warranty; and each file should have at least"
   echo "the \"copyright\" line and a pointer to where the full notice is found."
   echo ""
   echo "    {description}"
   echo "    Copyright (C) {year}  {fullname}"
   echo ""
   echo "    This program is free software; you can redistribute it and/or modify"
   echo "    it under the terms of the GNU General Public License as published by"
   echo "    the Free Software Foundation; either version 2 of the License, or"
   echo "    (at your option) any later version."
   echo ""
   echo "    This program is distributed in the hope that it will be useful,"
   echo "    but WITHOUT ANY WARRANTY; without even the implied warranty of"
   echo "    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
   echo "    GNU General Public License for more details."
   echo ""
   echo "    You should have received a copy of the GNU General Public License along"
   echo "    with this program; if not, write to the Free Software Foundation, Inc.,"
   echo "    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA."
   echo ""
   echo "Also add information on how to contact you by electronic and paper mail."
   echo ""
   echo "If the program is interactive, make it output a short notice like this"
   echo "when it starts in an interactive mode:"
   echo ""
   echo "    Gnomovision version 69, Copyright (C) year name of author"
   echo "    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type 'show w'."
   echo "    This is free software, and you are welcome to redistribute it"
   echo "    under certain conditions; type 'show c' for details."
   echo ""
   echo "The hypothetical commands 'show w' and 'show c' should show the appropriate"
   echo "parts of the General Public License.  Of course, the commands you use may"
   echo "be called something other than 'show w' and 'show c'; they could even be"
   echo "mouse-clicks or menu items--whatever suits your program."
   echo ""
   echo "You should also get your employer (if you work as a programmer) or your"
   echo "school, if any, to sign a \"copyright disclaimer\" for the program, if"
   echo "necessary.  Here is a sample; alter the names:"
   echo ""
   echo "  Yoyodyne, Inc., hereby disclaims all copyright interest in the program"
   echo "  'Gnomovision' (which makes passes at compilers) written by James Hacker."
   echo ""
   echo "  {signature of Ty Coon}, 1 April 1989"
   echo "  Ty Coon, President of Vice"
   echo ""
   echo "This General Public License does not permit incorporating your program into"
   echo "proprietary programs.  If your program is a subroutine library, you may"
   echo "consider it more useful to permit linking proprietary applications with the"
   echo "library.  If this is what you want to do, use the GNU Lesser General"
   echo "Public License instead of this License."
   echo ""
}

if [ $# -gt 0 ]; then
   while [ "${1+defined}" ]; do
      case "$1" in
         -\? | --help)
            print_usage
            ;;
         -d | --date)
               echo -e "#\n#  $(date +%Y/%m/%d\ %H:%M:%S)\n#"
               exit 0
            ;;
         -h | --header)
            if [ "${2+defined}" ] && [ -O "$PWD" ]; then
               print_header "$2"
            else
               print_header
            fi
            exit 0
            ;;
         -l | --license)
            print_license
            exit 0
            ;;
         -r | --readme)
            print_readme
            exit 0
            ;;
         -a | --all)
            if [ "${2+defined}" ] && [ -d "$2" ] && [ -O "$2" ]; then
               print_license > "$2"/LICENSE
               print_readme > "$2"/README.md
            else
               print_usage
            fi
            exit 0
            ;;
          *)
            print_usage
      esac
   done
else
   echo -e "#\n# Author: $(cat /etc/passwd | grep $USER | cut -d: -f5| cut -d, -f1) <antoniosergio@mail.com>"
   echo -e "# Date  : $(date +%Y/%m/%d\ %H:%M:%S)\n#"
fi
exit 0

