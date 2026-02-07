#!/bin/bash

backup() {

	read -p "Enter File or Directory name To Backup :" src
	
	read -p "Enter Destination Path (Press Enter for current directory) :" dest

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
		echo "Backup Completed..."
		echo "type : file"
		echo "file name : $src"
		echo "Backup Path : $(realpath "$backup_dir")"

	elif [[ -d "$src" ]];
	then
		cp -r "$src" "$backup_dir/"
		echo
		echo "Backup Completed..."
		echo "type : Directory"
		echo "Directory name : $src"
		echo "Backup Path : $(realpath "$backup_dir")"

	else
		echo
		echo "File or Directory not found!..."
	fi
}

