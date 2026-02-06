#!/bin/bash

search() {
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
}
