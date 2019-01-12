#!/bin/usr/sh
# Should be used in prepping the virtual machine for OSRS installation

# Init package index
sudo apt-get update && sudo apt-get upgrade -y

# Ubuntu Desktop (w/o office and web-browsing tools)
sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

# VNC Server...connections take place on port 5900 + display
sudo apt-get install vnc4server
sudo apt-get install xfce4 xfce4-goodies

# setup password
vncpasswd
#su -l -c 'printf "password\npassword\n\n" | vncpasswd' $USER # command didn't work
# this may have worked
printf "password\npassword\n\n" | vncpasswd

# Startup VNC
cat <<EOF >> ~/.vnc/xstartup
#!/bin/sh
startxfce4
EOF

chmod +x ~/.vnc/xstartup

vncserver :1

# VNC session info
ls -lah ~/.vnc/
ps -ef | grep vnc

# Reference:
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-16-04
sudo su
cat << 'EOF' > /etc/systemd/system/vncserver@.service
[Unit]
Description=Systemd VNC server startup script for Ubuntu 16.04 (may be wrong version)
After=syslog.target network.target

[Service]
Type=forking
User=CHANGEME
ExecStartPre=-/usr/bin/vncserver -kill :%i &> /dev/null
ExecStart=/usr/bin/vncserver -depth 24 -geometry 800x600 :%i
PIDFile=/home/CHANGEME/.vnc/%H:%i.pid
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
EOF

exit
sudo sed -i -e 's/CHANGEME/'"$USER"'/g' /etc/systemd/system/vncserver@.service

# Make system aware of new unit file
sudo systemctl daemon-reload
# Enable the unit file
# stdout "Created symlink from /etc/systemd/system/multi-user.target.wants/vncserver@1.service to /etc/systemd/system/vncserver@.service."
sudo systemctl enable vncserver@1.service

# okay, kill the server, then restart
vncserver -kill :1
sudo systemctl start vncserver@1
sudo systemctl status vncserver@1  # output should show active

