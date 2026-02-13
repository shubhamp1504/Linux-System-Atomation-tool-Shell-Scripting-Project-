#!/bin/bash

green="\e[32m"
blue="\e[34m"
end="\e[0m"

logged_info() {
	
	echo
	echo -e "${blue}Logged-in-user :${end}"
	echo -e "${green}"
	whoami
	echo -e "${end}"
	echo
	echo -e "${blue}User Details :${end}"
	echo -e "$green"
	id
	echo -e "$end"
}
