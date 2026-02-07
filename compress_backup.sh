#!/bin/bash
compress_backup() {

	while true
	do	
		echo
		echo "================== Compress / Uncompress and Auto Backup Tool ==========="
		echo
		echo "Selected Menu -"
		echo "1. Compress File/ Directory & Auto Backup"
		echo "2. Uncompress (Extract) Backup File"
		echo "3. exit"
		echo

		read -p "Enter your choice :" choice
		echo
	
		case $choice in
	
			1)
				read -p "Enter File or Directory name To Compress and Backup :" src
				read -p "Enter Destination Path (Press Enter for current directory) :" dest
	
				if [[ -z "$dest" ]];
	        		then
	                		dest="."
	        		fi

				backup_dir="$dest/backup_dir"
				mkdir -p "$backup_dir"
		
				DateTime=$(date +"%d-%m-%Y_%H:%M:%S")
	
				if [[ -f "$src" ]];
	        		then
					archive_name="$(basename "$src")_$DateTime.tar.gz"
					tar -czf "$backup_dir/$archive_name" "$src"
	
					echo
					echo "Compression and Backup Completed..."
					echo "type : file"
					echo "file name : $src"
					echo "Compressed file name : $archive_name"
					echo "Backup Path : $(realpath "$backup_dir")"
	
				elif [[ -d "$src" ]];
				then
					archive_name="$(basename "$src")_$DateTime.tar.gz"
					tar -czf "$backup_dir/$archive_name" "$src"
		
					echo
					echo "Compression and Backup Completed..."
					echo "type : Directory"
					echo "Directory name : $src"
					echo "Compressed file name : $archive_name"
					echo "Backup Path : $(realpath "$backup_dir")"
				else
					echo
					echo "File or Directory not found!..."
				fi
				;;
	
			
			2)
				read -p "Enter Compressed (.tar.gz) File Name : " zname
				read -p "Enter Extract Path (Press Enter for current directory) :" ectract_path

				if [[ -z "$extract_path" ]];
				then
					extract_path="."
				fi

				if [[ -f "$zname" ]];
				then
					tar -xzf "$zname" -C "$extract_path"

					echo
					echo "Uncompression Completed"
					echo "Compressed file name : $sname"
					echo "Extracted path :$(realpath "$extract_path")"
				else
					echo "Compressed file not found..."
				fi
				;;

			3)
				echo "exited..."
				return
				;;
	
			*)
				echo "Invalid Option..."
				;;

		esac
		read -p "Press Enter to continue..."
		clear
	done

}
