#!/bin/sh
#
# Bash script to find php backdoor in your linux box
# Copyright (c) Leonard Luangga
####################################################

$OUTPUT = "/tmp/suspectedfiles.txt"

rm -f $OUTPUT
touch $OUTPUT

#r57 shell
find . -name *.php -print | xargs grep "r57" >> $OUTPUT
find . -name *.php -print | xargs grep "[ phpinfo ]  [ php.ini ]  [ cpu ]  [ mem ]  [ users ]  [ tmp ]  [ delete ]"  >> $OUTPUT
find . -name *.php -print | xargs grep "safe_mode" >> $OUTPUT

#c99 shell
find . -name *.php -print | xargs grep "c99" >> $OUTPUT
find . -name *.php -print | xargs grep "phpshell" >> $OUTPUT
find . -name *.php -print | xargs grep "Safe-mode" >> $OUTPUT
find . -name *.php -print | xargs grep "Encoder    Tools    Proc.    FTP brute    Sec.    SQL    PHP-code    Update    Feedback    Self remove    Logout"  >> $OUTPUT
find . -name *.php -print | xargs grep "FaTaLisTiCz_Fx Fx29SheLL" >> $OUTPUT

#MyShell
find . -name *.php -print | xargs grep "MyShell" >> $OUTPUT
find . -name *.php -print | xargs grep "Echo commands" >> $OUTPUT
find . -name *.php -print | xargs grep "Auto error traping enabled" >> $OUTPUT

#PHP Shell
find . -name *.php -print | xargs grep "PHP Shell" >> $OUTPUT
find . -name *.php -print | xargs grep "Enable stderr-trapping?" >> $OUTPUT
find . -name *.php -print | xargs grep "Choose new working" >> $OUTPUT

#PHPShell by Macker
find . -name *.php -print | xargs grep "[ Main Menu ]      [ PHPKonsole ]      [ Haxplorer ]"  >> $OUTPUT
find . -name *.php -print | xargs grep "Haxplorer" >> $OUTPUT
find . -name *.php -print | xargs grep "PHPKonsole" >> $OUTPUT

#phpRemoteView
find . -name *.php -print | xargs grep "phpRemoteView:" >> $OUTPUT
find . -name *.php -print | xargs grep "REMVIEW TOOLS" >> $OUTPUT
find . -name *.php -print | xargs grep "phpRemoteView" >> $OUTPUT
find . -name *.php -print | xargs grep "perms" >> $OUTPUT

#other
find . -name *.php -print | xargs grep "exec($" >> $OUTPUT
find . -name *.php -print | xargs grep "system($" >> $OUTPUT
find . -name *.php -print | xargs grep "passthru($" >> $OUTPUT
find . -name *.php -print | xargs grep "shell_exec($" >> $OUTPUT
find . -name *.php -print | xargs grep "eval(gzinflate(" >> $OUTPUT

more $OUTPUT
