#! /bin/bash
printf "Installing RDP... " >&2
{
sudo useradd -m NEKO
sudo adduser NEKO sudo
echo 'NEKO:6969' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y
sudo apt install font-manager
sudo apt-get install xfce4-terminal
echo '2
' | sudo update-alternatives --config x-terminal-emulator

curl -LJO https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.3.4.11/qbittorrent-nox_x86_64-linux-musl_static.zip -o /home/NEKO/Desktop/
unzip /home/NEKO/Desktop/qbittorrent-nox_x86_64-linux-musl_static.zip
chmod u+x /home/NEKO/Desktop/qbittorrent-nox
/home/NEKO/Desktop/qbittorrent-nox --webui-port=6969
sudo adduser NEKO chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - NEKO -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi