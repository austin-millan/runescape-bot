#!/bin/bash
# Used to display IP information in virtual machine environments.
if [ -z "$1" ]
  then
    printf "Please specify an output filename (e.g. sudo ./$(basename -- "$0") output.txt"
	exit 1
fi

# verify sudo
if [[ $EUID > 0 ]]; then # we can compare directly with this syntax.
  echo "Please run as root/sudo"
  exit 1
else
    # get remote IP for ssh session
    if [[ -z "${SSH_CLIENT}" ]]; then
        SSH_IP=$(echo $SSH_CLIENT | awk '{ print $1}')
    else
        SSH_IP=""
    fi
	# Dump to file
	if hash "netstat" 2>/dev/null; then
		netstat -taucp | grep 'sshd\|rune*\|$(SSH_IP)'
	else
		printf "ERROR: cpulimit not found...\nInstall 'cpulimit' with 'sudo apt-get install cpulimit'\n\n"
	fi
fi


