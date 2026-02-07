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
        echo "======================================================================================================================"
        echo
        echo " ................................. Linux System Atomation Tool ...................................................... "
        echo
        echo "**********************************************************************************************************************"

        echo "Select Menu:-"
        echo
        echo "1. Show System Imformation"
        echo "2. Disk Usage"
        echo "3. Memory & CPU Usage"
        echo "4. File & Directory Operations"
        echo "5. search File"
        echo "6. Backup File/Directory Operations (manual)"
        echo "7. Logged-in User Information"
        echo "8. Compress/Uncompress File/Directory & Auto Backup"
        echo "9. Exit"
        echo "----------------------------------------------------------------------------------------------------------------------"


        read -p "Enter Your Choice : " choice

        case $choice in
                1)
			system_info
			echo
			;;

		2)
			disk_usage
			echo
			;;

		3)
			memory_cpu_usage
			echo
			;;

		4)
			file_dir
			echo
			;;

		5)
			search
			echo
			;;

		6)
			backup
			echo
			;;

		7)
			logged_info
			echo
			;;

		8)
			compress_backup
			echo
			;;

		9)
			echo "program existing..."
			exit 
			;;

		*)
			echo "Invalid Option..."
			;;
	
	esac
	read -p "Press Enter To Continue..."
done
