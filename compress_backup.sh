#!/bin/bash

green_a="\e[32m"
green_b="\e[2;32m"
green_c="\e[5;32m"
red="\e[31m"
red_a="\e[5;31m"
blue_a="\e[34m"
blue_b="\e[1;34m"
end="\e[0m"


compress_backup() {
	log_dir="$HOME/Linux-System-Atomation-tool-Shell-Scripting-Project-/logs"
	mkdir -p "$log_dir"
	activity_log="$log_dir/activity.log"


	
	> "$activity_log"

	while true
	do	
		echo
		echo -e "${green_b}==================${end} ${green_c}Compress / Uncompress and Auto Backup Tool ${end} ${green_b}==============${end}"
		echo
		echo -e "${blue_a}Selected Menu -${end}"
		echo -e "${green_b}1. Compress File/ Directory & Auto Backup"
		echo "2. Uncompress (Extract) Backup File"
		echo -e "3. exit${end}"
		echo
		
		echo -e "$blue_a"
		read -p "Enter your choice :" choice
		echo -e "${end}"
		echo
	
		case $choice in
			1)
				echo -e "$green_a"
				read -p "Enter File or Directory name To Compress and Backup :" src
				read -p "Enter Destination Path (Press Enter for current directory) :" dest
				echo -e "$end"

				if [[ -z "$dest" ]];
			       	then
					dest="."
				fi

				backup_dir="$dest/backup_dir"
				mkdir -p "$backup_dir"

				DateTime=$(date +"%d-%m-%Y_%H:%M:%S")
	
				if [[ -f "$src" ]] || [[ -d "$src" ]];
			       	then
					
					archive_name="$(basename "$src")_$DateTime.tar.gz"
					tar -czf "$backup_dir/$archive_name" "$src"
				    	if [[ $? -eq 0 ]];
				       	then
						echo
        					echo -e "$green_b"
        					echo "Compression and Backup Completed..."
    					  	echo "Source : $src"
        					echo -e "Compressed file name : $archive_name ${end}"
     						echo -e "${blue_a}Backup Path : $(realpath "$backup_dir") ${end}"

					        # ✅ Activity Logging
					        echo "$(date '+%F %T') | COMPRESS | $src | $archive_name" >> "$activity_log"
	
					        # ✅ File Size Check (Gmail 25MB limit safety)
					        filesize=$(du -m "$backup_dir/$archive_name" | cut -f1)

					        if [[ $filesize -lt 25 ]]; then
							# ✅ Send Mail with Attachment
						        echo "Backup File Created Successfully.

							File Name: $archive_name
							Location: $(realpath "$backup_dir")
							Time: $(date)" | \

            						echo -e "${green_b}Backup file sent successfully!${end}"
						else
					    		echo -e "${red}File size greater than 25MB. Mail not sent.${end}"
						fi
				    	else
						echo -e "${red}Compression Failed!${end}"
				    	fi
				else
				    	echo
				    	echo -e "${red}File or Directory not found!...${end}"
				fi
				;;
			
			2)

				echo -e "$green_a"
				LOG_FILE="./backup.log"
				
				# Auto detect backup directory
				backup_dir="./backup_dir"
				
				if [[ ! -d "$backup_dir" ]]; then
				    	echo -e "${red}backup_dir not found in current location!${end}"
					break
				    	
				fi
				
 				# List available backups
				mapfile -t backups < <(ls "$backup_dir"/*.tar.gz 2>/dev/null)
				
				if [[ ${#backups[@]} -eq 0 ]]; then    
					echo -e "${red}No backup files found in backup_dir!${end}"
					break
					
				fi
				
				echo -e "${blue_a}Available backup files:${end}"
				echo -e "$green_a"
				
				for i in "${!backups[@]}"; do				    
					echo "$((i+1))) $(basename "${backups[$i]}")"
				done
				echo -e "$end"
				
				echo
				echo -e "$green_b"
				read -p "Enter file number to extract: " choice
				echo -e "$end"
				selected_file="${backups[$((choice-1))]}"
	
				if [[ -z "$selected_file" ]]; then
					echo -e "${red_c}Invalid selection!${end}"
					break
					
				fi

				echo -e "$green_b"
				read -p "Enter Extract Path (Press Enter for current directory): " extract_path
				echo -e "$end"

				extract_path="${extract_path:-.}"

				if [[ ! -d "$extract_path" ]]; then
				    	echo -e "${red}Extract directory does not exist!${end}"
					break    	
				fi
				
				tar -xzf "$selected_file" -C "$extract_path"
				
				if [[ $? -eq 0 ]]; then
				    
					echo
				    	echo -e "${green_b}Uncompression Completed${end}"
				    	echo -e "${green_b}Extracted: $(basename "$selected_file")${end}"
				    	echo -e "${blue_a}Location : $(realpath "$extract_path") ${end}"
				    	
					# Logging
					echo "$(date '+%F %T') | EXTRACT | $(basename "$selected_file") | $extract_path" >> "$activity_log"
					echo -e "${green_b}Extraction details saved to logfile successfully...${end}"
				else
				    	echo -e "${red}Extraction Failed!${end}"
				fi
				;;

			3)
				echo -e "${green_a}exited...${end}"
				return
				;;
	
			*)
				echo -e "${red_a}Invalid Option...${end}"
				;;

		esac
		echo -e "$green_a"
		read -p "Press Enter to continue..."
		echo -e "$end"
		clear
	done

} 
