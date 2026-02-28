#!/bin/bash

green_a="\e[32m"                                                                                                                                            green_b="\e[2;32m"                                                                                                                                          green_c="\e[5;32m"                                                                                                                                          red="\e[31m"                                                                                                                                                red_a="\e[1;31m"                                                                                                                                            blue_a="\e[34m"                                                                                                                                             blue_b="\e[1;34m"                                                                                                                                           end="\e[0m"

search() {

	echo -e "$green_a"
	read -p "Enter File Name to Search :" sfile
	read -p "Enter path to Search (press enter for current directory):" spath
	echo -e "$end"

	if [[ -z "$spath" ]];
	then
		spath="."
	fi
	
	result=$(find "$spath" -name "$sfile" 2>/dev/null)

	if [[ -z "$result" ]];
	then
		echo -e "$red_a"
		echo "File or Directory Not Found"
		echo -e "$end"
	else
		while read -r item
		do
			fullpath=$(realpath "$item")
			if [[ -f "$item" ]];
			then
				echo -e "$green_b"
				echo
				echo "File is Found."
				echo
				echo "path : $fullpath"
				echo -e "$end"

			elif [[ -d "$item" ]];
			then
				echo -e "$green_b"
				echo
				echo "Directory is Found"
				echo
				echo "path : $fullpath"
				echo -e "$end"
			fi
			echo -e "$green_b"
			echo "-------------------------------------------"
			echo -e "$end"
		done <<< "$result"
	fi
}
