#!/bin/bash

file_dir() {
	while true
	do
		echo "1. Create File"
		echo "2. Create Directory"
		echo "3. Delete File"
		echo "4. Delete Directory"
		echo "5. exit"
	
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
	
			5)
				echo "exited..."
				exit 1
				;;
			
			*)
				echo "Invalid Option..............."
				;;
	
		esac
		read -p "Invalid Option..."
	done
}
