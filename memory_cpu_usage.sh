#!/bin/bash

memory_cpu_usage() {
    	echo "Memory Usage:- "
	echo
	free -h
	echo "------------------------------------"
	echo
	echo "CPU Usage :-"
	top -bn1 | head -5
	echo "------------------------------------"
}

