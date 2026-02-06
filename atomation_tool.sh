#!/bin/bash

import system_info


while true
do
        clear
        echo "====================================================================================================="
        echo
        echo " .........................Linux System Atomation Tool............................................... "
        echo
        echo "*****************************************************************************************************"

        echo "Select Menu:-"
        echo
        echo "1. Show System Imformation"
        echo "2. Disk Usage"
        echo "3. Memory & CPU Usage"
        echo "4. File & Directory Operations"
        echo "5. search File"
        echo "6. Backup Directory Operations (manual)"
        echo "7. Logged-in User Information"
        echo "8. Compress File/Directory & Auto Backup"
        echo "9. Exit"
        echo "----------------------------------------------------------------------------------------------------"


        read -p "Enter Your Choice : " choice

        case $choice in
                1)
                        
