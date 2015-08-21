# syslog2-installer
Small script to install papertrail's [remote_syslog2](https://github.com/papertrail/remote_syslog2])into a unix system

# Requirement
Installation directories are strictly unix based
Tested on Ubuntu 14.04

# Installation
```
sudo bash<( curl -fsSL https://raw.githubusercontent.com/jellene4eva/syslog2-installer/master/install.sh )
```
* Downloads and extract tar.gz from [remote_syslog2/releases](https://github.com/papertrail/remote_syslog2/releases)
* Copy the precompiled remote_syslog2 into `/usr/local/bin`
* Downloads and insert remote_syslog's init.d configuration into `/etc/init.d/remote_syslog`
* Update system to start service automatically during reboot
* Export `remote_syslog` command to PATH
* Copies example_config.yml provided into default `/etc/log_files.yml` and opens it
* Restarts the service
* Deletes the tmp dir

#Config
After installing the config file, it will ask to edit your config file.
See more at: [remote_syslog2/examples](https://github.com/papertrail/remote_syslog2/tree/master/examples)
```
files:
 - /var/log/nginx/error.log
 - /var/log/mysql/error.log
 - /home/deploy/log/production.log
destination:
  host: logs.papertrailapp.com
  port: 12345
  protocol: tls
```

