# Used to manually set the maximum CPU usage of JVM.

if hash "cpulimit" 2>/dev/null; then
	printf "LIMITING JAVA TO 40% CPU USAGE"
    cpulimit -l 40 $(pgrep java)
else
	printf "ERROR: cpulimit not found...\nInstall 'cpulimit' with 'sudo apt-get install cpulimit'\n\n"
fi
