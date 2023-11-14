#!/bin/bash

if ! command -v speedometer &> /dev/null; then
    echo "install speedometer..."
    sudo apt-get install -y speedometer   # Debian/Ubuntu
    # sudo yum install -y speedometer      # CentOS/RHEL
fi

if [ $# -eq 0 ]; then

    # If no NIC is specified, a list of all nics is obtained
    network_interfaces=$(ip -o link show | awk -F': ' '{print $2}' | tr '\n' ' ')
else
    network_interfaces="$@"
fi

for interface in $network_interfaces; do
    args="$args -r $interface -t $interface"
done

speedometer $args
