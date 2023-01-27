#!/bin/bash
tput bold 
menu() {
    command clear 
    echo 
    figlet ForenSick
    echo "A Basic Digital Forensics Tool Created By PsycoLulz"    
    echo 
    echo "1. Check Image Strings"
    echo "2. Search Image For Embedded Files"    
    echo "3. Check Exif Data Of Image"     
    echo "4. Determine File Type And Data"  
    echo "5. Display HEXADECIMAL/ASCII/DECIMAL/OCTAL Binary File Content"        
    echo "6. Exit"
    echo 
    read -p $'Please Choose An Option: ' forensick
    if [[ $forensick == "1" ]]
    then 
    strngs 
    elif [[ $forensick == "2" ]]
    then 
    bnwlk
    elif [[ $forensick == "3" ]]
    then 
    xf
    elif [[ $forensick == "4" ]]
    then 
    fl
    elif [[ $forensick == "5" ]]
    then 
    hxdmp
    elif [[ $forensick == "6" ]]
    then 
    echo 
    echo "Have A Great Day, Hack The Planet!!!"
    command exit 
    else
    command clear 
    menu 
    fi 
}
strngs() {
    command clear 
    figlet Strings 
    read -p $'Enter File Name Here: ' filename 
    strngs2
}
strngs2() {
    read -p $'Enter String Length To Show: ' stringlength
    command clear 
    echo 
    command strings -$stringlength $filename 
}
bnwlk() {
    command clear 
    figlet Binwalk 
    read -p $'Enter File Name Here: ' filename 
    command clear 
    echo 
    command binwalk -Me $filename 
}
xf() {
    command clear
    figlet ExifTool
    read -p $'Enter File Name Here: ' filename
    command clear 
    echo  
    command exiftool $filename 
}
fl() {
    command clear 
    figlet File 
    read -p $'Enter File Name Here: ' filename 
    command clear 
    echo 
    command file $filename 
}
hxdmp() {
    command clear
    figlet HexDump 
    read -p $'Enter File Name Here: ' filename 
    hxdmpc
}
hxdmpc() {
    command clear 
    echo 
    echo File Name Entered: $filename 
    echo 
    echo "1. one-byte octal display"
    echo "2. one-byte character display"
    echo "3. canonical hex+ASCII display"
    echo "4. two-byte decimal display"
    echo "5. two-byte octal display"
    echo "6. two-byte hexadecimal display"
    echo 
    read -p $'Please Choose An Option: ' hxdmpopt 
    if [[ $hxdmpopt == "1" ]]
    then 
    command clear 
    echo 
    command hexdump --one-byte-octal $filename 
    elif [[ $hxdmpopt == "2" ]]
    then 
    command clear 
    echo 
    command hexdump --one-byte-char $filename 
    elif [[ $hxdmpopt == "3" ]]
    then 
    command clear 
    echo 
    command hexdump --canonical $filename 
    elif [[ $hxdmpopt == "4" ]]
    then 
    command clear 
    echo 
    command hexdump --two-bytes-decimal $filename 
    elif [[ $hxdmpopt == "5" ]]
    then 
    command clear 
    echo 
    command hexdump --two-bytes-octal $filename 
    elif [[ $hxdmpopt == "6" ]]
    then 
    command clear 
    echo 
    command hexdump --two-bytes-hex $filename 
    else 
    command clear 
    hxdmpc
    fi 
}
menu 