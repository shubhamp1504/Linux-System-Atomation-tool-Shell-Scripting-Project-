#!/bin/bash

backup() {
	read -p "Enter Directory To Backup :" src
	read -p "Enter Destination Path :" dest
	if [[ -d "$src" ]];
	then
		tar -czf "$dest/backup_$(date +%F).tar.gz" "$src"
		echo "Backup Completed Successfully..........."
	else
		echo "Directory Not Found"
	fi
}

