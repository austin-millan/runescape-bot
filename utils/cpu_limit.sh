#!/bin/bash
# Used to manually set the maximum CPU usage of Java and Runemate processes.

JAVA_LIMIT=40
RUNEMATE_LIMIT=40
JAVA_PIDS=$(pgrep java)
RUNEMATE_PID=$(pgrep runemate)

if hash "cpulimit" 2>/dev/null; then

    for j in $JAVA_PIDS
    do
        printf "Limiting Java (PID: $j) CPU usage to: $JAVA_LIMIT%%.\n"
        cpulimit -p $j -l $JAVA_LIMIT -z &
    done

    printf "Limiting Runemate (PID: $RUNEMATE_PID) CPU usage to: $RUNEMATE_LIMIT%%.\n"
    cpulimit -p $RUNEMATE_PID -l $RUNEMATE_LIMIT -z
else
	printf "ERROR: cpulimit not found...\nInstall 'cpulimit' with 'sudo apt-get install cpulimit'\n\n"
fi
