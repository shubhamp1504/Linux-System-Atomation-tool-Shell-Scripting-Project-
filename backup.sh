#!/bin/bash


green_a="\e[32m"
green_b="\e[2;32m"
red="\e[5;31m"
blue="\e[34m"
end="\e[0m"

backup() {
	echo -e "$green_b"
	read -p "Enter File or Directory name To Backup :" src
	read -p "Enter Destination Path (Press Enter for current directory) :" dest
	echo -e "$end"

	if [[ -z "$dest" ]];
	then
		dest="."
	fi

	backup_dir="$dest/backup"
	mkdir -p "$backup_dir"


	if [[ -f "$src" ]];
	then
		cp "$src" "$backup_dir/"
		echo
		echo -e "${green_a}Backup Completed..."
		echo "type : file"
		echo -e "file name : $src ${end}"
		echo -e "${blue}Backup Path : $(realpath "$backup_dir") ${end}"

	elif [[ -d "$src" ]];
	then
		cp -r "$src" "$backup_dir/"
		echo
		echo -e "${green_a}Backup Completed..."
		echo "type : Directory"
		echo -e "Directory name : $src ${end}"
		echo -e "${blue} Backup Path : $(realpath "$backup_dir") ${end}"

	else
		echo
		echo -e "${red}File or Directory not found!...${end}"
	fi
}

