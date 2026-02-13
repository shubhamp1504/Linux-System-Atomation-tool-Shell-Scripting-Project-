#!/bin/bash

green_a="\e[32m"                                                                                                                     green_b="\e[2;32m"                                                                                                                   green_c="\e[5;32m"                                                                                                                   red="\e[31m"                                                                                                                         red_a="\e[5;31m"                                                                                                                     blue_a="\e[34m"                                                                                                                      blue_b="\e[1;34m"                                                                                                                    end="\e[0m"


memory_cpu_usage() {
    	echo -e "${blue_b}Memory Usage:- ${end}"
	echo
	echo -e "$green_b"
	free -h
	echo -e "$end"
	echo -e "${green_a}-----------------------------------------------------------------------------${end}"
	echo
	echo -e "${blue_b}CPU Usage :-${end}"
	echo -e "$green_b"
	echo
	top -bn1 | head -5
	echo -e "$end"
	echo -e "${green_a}------------------------------------------------------------------------------${end}"
}

