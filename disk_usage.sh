#!/bin/bash

green_a="\e[32m"
blue_a="\e[34m"
end="\e[0m"

disk_usage() {

	echo -e "${blue_a}Disk Usage:- ${end}"
	echo -e "${green_a}"
	df -h
	echo -e "--------------------------------------------------------------------${end}"
}

