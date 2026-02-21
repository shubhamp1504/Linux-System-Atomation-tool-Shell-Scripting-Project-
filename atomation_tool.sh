#!/bin/bash


green_a="\e[32m"
green_b="\e[2;32m"
green_c="\e[5;32m"
red_a="\e[5;31m"
blue_a="\e[34m"
blue_b="\e[1;34m"
end="\e[0m"

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
        echo
	echo -e "${green_b}**********************************${end} ${green_c} Linux System Atomation Tool ${end} ${green_b} *************************************${end}"
        echo

        echo -e "${blue_a}Select Menu:-${end}"
        echo
        echo -e "${green_a}1. Show System Imformation"
        echo "2. Disk Usage"
        echo "3. Memory & CPU Usage"
        echo "4. File & Directory Operations"
        echo "5. search File"
        echo "6. Backup File/Directory Operations (manual)"
        echo "7. Logged-in User Information"
        echo "8. Compress/Uncompress File/Directory & Auto Backup"
        echo "9. Exit"
        echo -e "----------------------------------------------------------------------------------------------------------------------${end}"


	echo -e "${blue_b}"
        read -p "Enter Your Choice : " choice
	echo -e "${end}"
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
			exit_time=$(date "+%Y-%m-%d %H:%M:%S")
			log_dir="$HOME/Linux-System-Atomation-tool-Shell-Scripting-Project-/logs"
			mkdir -p "$log_dir"
			report_file="$log_dir/report.txt"

			{
				echo "Linux Automation Tool Exit Report"
			        echo "-------------------------------------------"
			        echo "User: $USER"
			    	echo "Hostname: $(hostname)"
			    	echo "Exit Time: $exit_time"
			    	echo
				
				if [[ -f "$activity_log" ]]; then
					echo "Activity Summary:"
					echo "-------------------------------------------"
					cat "$activity_log"
			    	else
					echo "No activity log found for this session."
			    	fi
			} > "$report_file"
			
			# Send Mail only if report file created
			if [[ -f "$report_file" ]]; then
			    
				mail -s "Project Exit Update - Linux Automation Tool" \ shubhamvpatil01@gmail.com < "$report_file"
				echo -e "${green_a}Report sent to email successfully... ${end}"
			else
				echo -e "${red}Report file not created. Mail not sent.${end}"
			
			fi
			
			sleep 1s
			echo -e "${green_a}Program exiting... ${end}"
			echo
			exit
			;;

		*)
			echo -e "${red_a} Invalid Option... ${end}"
			;;
	
	esac
	echo -e "${green_a}"
	read -p "Press Enter To Continue..."
	echo -e "${end}"
done
