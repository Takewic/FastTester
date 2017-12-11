#!/bin/bash
programas="apache2 speedtest-cli stress memtester lshw dialog htop hdparm sysbench"
for x in echo $programas ; do
	apt-get remove $x --purge -y
	apt-get purge $x -y
done

apt-get autoremove -y

rm -rf /usr/lib/cgi-bin/* /var/www/html/* /usr/bin/takewic /usr/share/takewic
clear
echo "O programa foi removido com sucesso."
