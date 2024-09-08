#!  /usr/local/bin/bash


ifconfig iwn0  up

ifconfig iwn0 scan | 

sed '/iwn0/,/network/d' |
	
sed -e 's/.*nwid\(.*\)chan.* /\1/' |

sed '/""/d' |sed '/0x0/d' | uniq | head -n 10 
	
read -p "Type out the name of your ssid: " ssid_name
	
read -p "Enter your passphrase: " WPAkey

cd  "../../.."

cd "/etc"

echo inet autoconf join ${ssid_name} wpakey ${WPAkey} >> hostname.iwn0

sh /etc/netstart
