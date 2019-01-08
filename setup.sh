# Install Java 8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y install oracle-java8-installer
# Optional
# ulimit -c unlimited
# Install RSU (RS3 & OSRS)
# RS3
sudo apt-add-repository -y ppa:hikariknight/unix-runescape-client
sudo apt-get -y update && sudo apt-get -y install unix-runescape-client
# OSRS (https://oldschool.runescape.wiki/w/Linux_game_installation_guide)
rm -Rf ~/'runescape/oldschool' '/tmp/oldschool' && mkdir -p ~/'runescape/oldschool' '/tmp/oldschool' && wget -O '/tmp/oldschool/OldSchool.msi' 'http://www.runescape.com/downloads/oldschool.msi' && 7z e -o'/tmp/oldschool/OldSchool-msi' -y '/tmp/oldschool/OldSchool.msi' && 7z e -o'/tmp/oldschool/rslauncher-cab' -y '/tmp/oldschool/OldSchool-msi/rslauncher.cab' && cp '/tmp/oldschool/rslauncher-cab/JagexAppletViewerJarFile'* ~/'runescape/oldschool/jagexappletviewer.jar' && wget -O ~/'runescape/oldschool/jagexappletviewer.png' 'https://lh3.googleusercontent.com/WLvp10q8TwtyVgMsYL7gW0c7NVG5vnFcRNS7oQtTnSyWbM9kgo_MS8QZa3bsylNgZDba' && rm -Rf '/tmp/oldschool' && sync

# Setup desktop application
mkdir -p ~/'.local/share/applications'
touch ~/'.local/share/applications/Old School RuneScape.desktop'
cat <<EOT >> ~/'.local/share/applications/Old School RuneScape.desktop'
[Desktop Entry]
Name=Old School RuneScape
Comment=Relive the challenging levelling system and risk-it-all PvP of the biggest retro styled MMO. Play with millions of other players in this piece of online gaming heritage where the community controls the development so the game is truly what you want it to be!
Categories=Game;Java;AdventureGame;RolePlaying
Exec='/usr/bin/java' -Duser.home='/home/CHANGEME/runescape/oldschool' -Djava.class.path='/home/CHANGEME/runescape/oldschool/jagexappletviewer.jar' -Dcom.jagex.config='http://oldschool.runescape.com/jav_config.ws' -Dawt.useSystemAAFontSettings='on' -Dswing.aatext='true' -Dhttps.protocols='TLSv1.2' -Dsun.java2d.opengl='false' -Dsun.java2d.uiScale='1' 'jagexappletviewer' 'oldschool'
Type=Application
StartupNotify=true
Path=/home/CHANGEME/runescape/oldschool
Icon=/home/CHANGEME/runescape/oldschool/jagexappletviewer.png
Actions=Screen;Update;Cache;

[Desktop Action Screen]
StartupNotify=false
Exec='/usr/bin/wmctrl' -r 'Old School RuneScape' -b toggle,fullscreen -F
Name=Toggle Fullscreen/Windowed

[Desktop Action Update]
StartupNotify=false
Exec='/bin/bash' -c "notify-send 'Updating the Old School RuneScape client, please wait...' && rm -Rf '/tmp/oldschool' && mkdir -p '/home/CHANGEME/runescape/oldschool' '/tmp/oldschool' && wget -q -O '/tmp/oldschool/OldSchool.msi' 'http://www.runescape.com/downloads/oldschool.msi' && 7z e -o'/tmp/oldschool/OldSchool-msi' -y '/tmp/oldschool/OldSchool.msi' && 7z e -o'/tmp/oldschool/rslauncher-cab' -y '/tmp/oldschool/OldSchool-msi/rslauncher.cab' && cp '/tmp/oldschool/rslauncher-cab/JagexAppletViewerJarFile'* '/home/CHANGEME/runescape/oldschool/jagexappletviewer.jar' && rm -Rf '/tmp/oldschool' && sync && notify-send 'The Old School RuneScape client has been updated!'"
Name=Update Client

[Desktop Action Cache]
StartupNotify=false
Exec='/bin/bash' -c "rm -Rf '/home/CHANGEME/runescape/oldschool/jagexcache' '/home/CHANGEME/runescape/oldschool/jagexappletviewer.preferences' '/home/CHANGEME/runescape/oldschool/jagex_cl_oldschool_LIVE.dat' '/home/CHANGEME/runescape/oldschool/random.dat' '/tmp/oldschool' && sync && notify-send 'The Old School RuneScape cache has been cleaned.'"
Name=Cache Cleanup
EOT

sed -i 's/'CHANGEME'/'$USER'/g' ~/'.local/share/applications/Old School RuneScape.desktop'

# Create alias for executing OSRS
cat <<EOT >> ~/.bashrc
alias oldschool="cd ~/'runescape/oldschool' && java -Duser.home='.' -Djava.class.path='jagexappletviewer.jar' -Dcom.jagex.config='http://oldschool.runescape.com/jav_config.ws' 'jagexappletviewer' 'oldschool'"
EOT
source ~/.bashrc

# Install RuneMate
chmod +x RuneMate_setup.sh
./RuneMate_setup.sh
