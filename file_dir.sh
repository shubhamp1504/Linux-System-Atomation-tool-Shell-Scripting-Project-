#!/bin/bash
                                                                                                                                    
green_a="\e[32m"                                                                                    
green_b="\e[2;32m" 
green_c="\e[5;32m"
red="\e[31m"
red_a="\e[1;31m" 
blue_a="\e[34m"
blue_b="\e[1;34m"                          
end="\e[0m"


file_dir() {
	while true
	do
		echo
		echo -e "${green_b}=========================${end} ${green_c}File and Directory Opretions Tool${end} ${green_b}========================${end}"
		echo

		echo -e "${blue_a}Selected menu -${end}"
		echo -e "${green_b}1. Create File"
		echo "2. Create Directory"
		echo "3. Delete File"
		echo "4. Delete Directory"
		echo -e "5. exit${end}"
		echo
		echo -e "$blue_b"
		read -p "Choose Option:" achoice
		echo -e "$end"
	
		case $achoice in
			1)
				echo -e "$green_b"
				read -p "Entar File Name : " fname
				echo -e "$end"
				if [[ -z $fname ]];
				then
					echo -e "${red} file name cannot be empty...${end}"
				else
					touch "$fname"
					echo -e "${green_a}File Created Successfully...........${end}"
				fi
				;;
	
			2)
				echo -e "$green_b"
				read -p "Enter Directory Name : " dname
				echo -e "$end"
				if [[ -z $dname ]];
                                then
                                        echo -e "${red} Directory name cannot be empty...${end}"
                                else
					mkdir "$dname"
					echo -e "${green_a}Directory created Successfully.............${end}"
				fi				
				;;
	
			3)
				echo -e "$green_b"
				read -p "Entar File Name To Delate :" fdelate
				echo -e "$end"
				if [[ -z $fdelate ]];
                                then
                                        echo -e "${red} file name cannot be empty...${end}"
                                
				elif [[ -f $fdelate ]];
				then
					echo -e "$red"
					read -p "Are you sure you want to delete '$fdelate'? (y/n): " confirm
					echo -e "$end"

					if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then

						rm "$fdelate"
						echo -e "${green_a}Deleted $fdelate File Successfully........${end}"
				    	else
						echo -e "${red}File not deleted.${end}"
				    	fi

				else
					echo -e "${red}Can not Found $fdelate File${end}"
				fi
				;;
	
			4)
				echo -e "$green_b"
				read -p "Enter Directory Name To Delate :" ddelate
				echo -e "$end"
				if [[ -z $ddelate ]];
                                then
                                        echo -e "${red} Directory name cannot be empty...${end}"

				elif [[ -d $ddelate ]];
				then
					echo -e "$red"
					read -p "Are you sure you want to delete '$ddelate'? (y/n): " confirm
					echo -e "$end"

					if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then

						rm -r "$ddelate"
						echo -e "${green_a}Deleted $ddelate Directory Successfully........${end}"
				    	else
						echo -e "${red}Directory not deleted.${end}"
				    	fi


				else
					echo -e "${red}Can not Found $ddelate directory${end}"
				fi
				;;
	
			5)
				echo -e "${green_b}exited...${end}"
				return
				;;
			
			*)
				echo -e "${red_a}Invalid Option...............${end}"
				;;
	
		esac
		echo -e "$green_b"
		read -p "Press Enter to continue..."
		echo -e "$end"
		clear
	done
}
