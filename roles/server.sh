#!/bin/bash

timedatectl set-timezone 'UTC'

echo Machine Name:
read machine_name

prepend_file /etc/hostname "${machine_name}"
prepend_file /etc/hosts "127.0.0.1 localhost"
prepend_file /etc/hosts "127.0.0.1 ${machine_name}"

adduser ${admin_user}
usermod -a -G sudo ${admin_user}

echo Admin Password:
read admin_password

echo "${admin_password}" | passwd "${admin_user}" --stdin

append_file /etc/ssh/sshd_config ""
append_file /etc/ssh/sshd_config "#> CONFIGURATION <#"
append_file /etc/ssh/sshd_config "Port 1001"
append_file /etc/ssh/sshd_config "PermitRootLogin no"

sudo systemctl restart ssh