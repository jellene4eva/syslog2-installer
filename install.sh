#!bin/bash

mkdir syslog_tmp
cd syslog_tmp

echo "====== Downloading remote_syslog2 ======"
curl -sSLO https://github.com/papertrail/remote_syslog2/releases/download/v0.13/remote_syslog_linux_amd64.tar.gz
wait
tar xvf remote_syslog_linux_amd64.tar.gz
cd remote_syslog

sudo cp ./remote_syslog /usr/local/bin

echo "====== Setup init.d service ======"
sudo curl -sSL https://raw.githubusercontent.com/papertrail/remote_syslog2/master/examples/remote_syslog.init.d -o /etc/init.d/remote_syslog
wait
sudo chmod 755 /etc/init.d/remote_syslog
sudo update-rc.d remote_syslog defaults

echo "====== Exporting to PATH ======"
export PATH=/usr/local/bin/remote_syslog:$PATH

echo "====== Copying config files ======"
sudo cp example_config.yml /etc/log_files.yml
sudo vi /etc/log_files.yml
