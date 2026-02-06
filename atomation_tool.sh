#!/bin/bash

source ./system_info.sh
source ./disk_usage.sh
source ./memory_cpu_usage.sh
source ./file_dir.sh
source ./search.sh
source ./backup.sh 
source ./logged_info.sh
source ./compress_backup.sh


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
			system_info
			echo
			read -p "Press Enter To Continue..."
			;;

		2)
			disk_usage
			echo
			read -p "Press Enter To Continue..."
			;;

		3)
			memory_cpu_usage
			echo
			read -p "Press Enter To Continus..."
			;;

		4)
			file_dir
			echo
			read -p "Press Enter To Continue..."
			;;

		5)
			search
			echo
			read -p "Press Enter To Continue..."
			;;

		6)


	esac
done
