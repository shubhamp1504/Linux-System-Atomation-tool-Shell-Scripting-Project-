#!/bin/bash

green="\e[32m"
green_a="\e[2;32m"
blue="\e[34m"
end="\e[0m"

system_info() {
	echo -e "${blue}System Information:- ${end}"
	echo
	echo -e "$green"
	uname -a
	echo -e "$end"
	echo -e "${green_a}-----------------------------------------------------------------------------------------${end}"
	echo
	echo -e "${blue}Hostname is : $(hostname) ${end}"
	echo
	echo -e "${green_a}-----------------------------------------------------------------------------------------${end}"
	echo
	echo -e "${blue}Uptime: ${end}"
	echo
	echo -e "$green_a"
	uptime
	echo -e "$end"
	echo -e "${green_a}------------------------------------------------------------------------------------------${end}"
}


