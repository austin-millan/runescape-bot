# Install Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
# Optional
 # ulimit -c unlimited
# Install RSU
sudo apt-add-repository ppa:hikariknight/unix-runescape-client
sudo apt-get update && sudo apt-get install unix-runescape-client
# Install RuneMate
chmod +x RuneMate_setup.sh
./RuneMate_setup.sh
