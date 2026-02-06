#!/bin/bash

system_info() {
	echo "System Information:- "
	echo
	uname -a
	echo "------------------------------"
	echo
	echo "Hostname is : $(hostname)"
	echo "-------------------------------"
	echo
	echo "Uptime: "
	uptime
	echo "-------------------------------"
}


