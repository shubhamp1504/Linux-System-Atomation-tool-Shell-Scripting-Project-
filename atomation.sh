#!/bin/bash


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
			echo "System Information:- "
			echo
			uname -a
			echo "------------------------------"
			echo
			echo "Hostname is : $(hostname)"
			echo "-------------------------------"
			echo
			echo "Uptime: "
			uptime
			echo "-------------------------------"

			read -p "Process Enter to continue..."
			;;

		2)
			echo "Disk Usage:- "
			echo
			df -h
			echo "----------------------------------"

			read -p "press Enter to continue..."
			;;

		3)
			echo "Memory Usage:- "
			echo
			free -h
			echo "------------------------------------"
			echo
			echo "CPU Usage :-"
			top -bn1 | head -5
			echo "------------------------------------"

			read -p "Press Enter to continue..."
			;;

		4)
			echo "1. Create File"
			echo "2. Create Directory"
			echo "3. Delete File"
			echo "4. Delete Directory"

			read -p "Choose Option:" achoice
			
			case $achoice in
				1)
					read -p "Entar File Name : " fname
					touch "$fname"
					echo "File Created Successfully..........."
					;;
				2)
					read -p "Enter Directory Name : " dname
					mkdir "$dname"
					echo "Directory created Successfully............."
					;;
				3)
					read -p "Entar File Name To Delate : " fdelate
					if [[ -f $fdelate ]];
					then
						rm -i "$fdelate"
						echo "Delated $fdelate File Successfully........................."
					else
						echo "Can not Found $fdelate File"
					fi
					;;
				4)
					read -p "Enter Directory Name To Delate :" ddelate
					if [[ -d $ddelate ]];
					then
						rm -ri "$ddelate"
						echo "Delated $ddelate Directory Successfully....................."
					else
						echo "Can not Found $ddelate directory"
					fi
					;;

				*)
					echo "Invalid Option..............."
			esac
			read -p "Press Enter to continue..."
			;;

		5)
			read -p "Enter File Name to Search :" sfile
			read -p "Enter path to Search (press enter for current directory):" spath

			if [[ -z "$spath" ]];
			then
				spath="."
			fi

			result=$(find "$spath" -name "$sfile" 2>/dev/null)

			if [[ -z "$result" ]];
			then
				echo "File or Directory Not Found"
			else
				while read -r item
				do
					fullpath=$(realpath "$item")
					if [[ -f "$item" ]];
					then
						echo
						echo "File is Found."
						echo
						echo "path : $fullpath"
					elif [[ -d "$item" ]];
					then
						echo
						echo "Directory is Found"
						echo
						echo "path : $fullpath"
					fi
					echo "-------------------------------------------"
		 		done <<< "$result"
			fi

			read -p "Press Enter To Continue..."
			;;

		6)	
			read -p "Enter Directory To Backup :" src
			read -p "Enter Destination Path :" dest
			
			if [[ -d "$src" ]];
			then
				tar -czf "$dest/backup_$(date +%F).tar.gz" "$src"
				echo "Backup Completed Successfully..........."
			else
				echo "Directory Not Found"
			fi
			read -p "Press Enter to Continue..."
			;;

		7)
			echo "Logged-in-user :"
			whoami
			echo "User Details :"
			id
			read -p "Press Enter To Continue..."
			;;
		8)
			read -p "Enter File or Directory to Compress :" compress
			
			if [[ -e "$compress" ]];
			then
				backup_dir="$HOME/backup"
				mkdir -p "$backup_dir"

				backup_file="$backup_dir/$(basename "$compress")_$(date +%F_%H:%M:%S).tar.gz"
				
				tar -czf "$backup_file" "$compress"
				
				echo "Compression & Backup successfull!!!.."
				echo "Backup Saved at : $backup_file"

			else
				echo "File or Directory does not exist"
			fi
			read -p "Press Enter To Continue..."
			;;


		9)
			echo "Exiting................. "
			exit
			;;

		*)
			echo "Invalid Choice..."
			read -p "Press Enter to Continue..."
	esac
done	

