#!/bin/bash
#création des utilisateurs
apt-get update && apt-get -y upgrade
apt-get install -y sudo
sudo apt-get install -y proftpd
sudo apt get install -y openssl
sudo useradd -m "Merry" -p "$(echo "kalimac" | openssl passwd -1 -stdin)"
sudo useradd -m "pippin" -p "$(echo "secondbreakfast" | openssl -1 -stdin)"

#copie des config.conf dans conf.d
sudo cp configproftpd/proftpd.conf /etc/proftpd/conf.d
sudo cp configproftpd/tls.conf /etc/proftpd/conf.d
sudo cp configproftpd/modules.conf /etc/proftpd/conf.d

sudo ln -sf /etc/proftpd/conf.d/proftpd.conf /etc/proftpd/proftpd.conf
sudo ln -sf /etc/proftpd/conf.d/tls.conf /etc/proftpd/tls.conf
sudo ln -sf /etc/proftpd/conf.d/modules.conf /etc/proftpd/modules.conf

#création dossier et clé ssl (marche pas j'y arrivd ap)
sudo mkdir /etc/proftpd/ssl
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

