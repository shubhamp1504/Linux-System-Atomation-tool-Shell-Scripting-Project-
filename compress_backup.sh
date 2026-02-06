#!/bin/bash
compress_backup() {
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
}

