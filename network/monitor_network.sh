#!/bin/bash

NETWORK_INTERFACE="enp2s0"

if ! command -v speedometer &> /dev/null; then
    echo "安装 speedometer..."
    sudo apt-get install -y speedometer   #  Debian/Ubuntu
    # sudo yum install -y speedometer      #  CentOS/RHEL
fi

speedometer -r "$NETWORK_INTERFACE" -t "$NETWORK_INTERFACE"

