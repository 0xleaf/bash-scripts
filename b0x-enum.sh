#!/bin/bash

# define functions
help() {
    echo "Usage: $0 target [-u USER] [-p PASS] [-h]"
    echo "  target | IP address of the target"
    echo "  -u | Username to use (default ' ')"
    echo "  -p | Password to use (default ' ')"
    echo "  -v | Verbose mode"
    echo "  -h | Show help screen"
}

# parse user options
v=0
ip=$1

if [ $# -eq 0 ]; then
    echo "Error: No options provided." >$2
    help
    exit 1
fi

while getopts ":hu:p:v" opt; do
        case $opt in
            h)
                help
                exit 0
                ;;
            u)
                user=$OPTARG
                ;;
            p)  pass=$OPTARG
                ;;
            v)  v=1
                ;;
            *)
                echo "Invalid option: -$OPTARG" >&2
                usage
                exit 1
                ;;
        esac
done

# store base commands
nmap_c="nmap -sV -sC -p- -T4 $ip"
enum4linux_c="enum4linux-ng $ip"



echo "Running nmap scan for $ip..."
 
