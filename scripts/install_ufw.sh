#!/bin/bash

sudo apt install -y ufw
sudo ufw allow [ssh|${ssh_port}]
sudo ufw allow http/tcp
sudo ufw allow https
sudo ufw enable

sudo ufw status