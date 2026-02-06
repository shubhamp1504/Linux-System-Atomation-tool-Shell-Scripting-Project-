#!/bin/bash


while true
do
	clear
	echo "=========================================="
	echo " ...Linux System Atomation Tool... "

	echo "******************************************"

	echo "Select Menu:-"
	echo "1. Show System Imformation"
	echo "2. Disk Usage"
	echo "3. Memory & CPU Usage"
	echo "4. File & Directory Operations"
	echo "5. search File"
	echo "6. Backup Directory Operations (manual)"
	echo "7. Logged-in User Information"
	echo "8. Compress File/Directory & Auto Backup"
	echo "9. Exit"
	echo "--------------------------------------------"
	

	read -p "Enter Your Choice : " choice
	
	case $choice in
		1)
			echo "System Information:- "
			uname -a
			echo "Hostname is : $(hostname)"
			echo "Uptime: "
			uptime
			read -p "Process Enter to continue..."
			;;

		2)
			echo "Disk Usage:- "
			df -h
			read -p "press Enter to continue..."
			;;

		3)
			echo "Memory Usage:- "
			free -h
			echo "CPU Usage :-"
			top -bn1 | head -5
			read -p "Press Enter to continue..."
			;;

		4)
			echo "1. Create File"
			echo "2. Create Directory"
			echo "3	

