# Install Java 8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y install oracle-java8-installer
# Optional
 # ulimit -c unlimited
# Install RSU
sudo apt-add-repository -y ppa:hikariknight/unix-runescape-client
sudo apt-get -y update && sudo apt-get -y install unix-runescape-client
# Install RuneMate
chmod +x RuneMate_setup.sh
./RuneMate_setup.sh
