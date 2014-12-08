#!/bin/bash

sudo apt-get -y install openvswitch-switch openvswitch-datapath-dkms git

git clone git://github.com/openstack-dev/devstack.git

cd devstack

git checkout stable/icehouse

touch local.conf

cat <<EOF>> /home/vagrant/devstack/local.conf

[[local|localrc]]
ADMIN_PASSWORD=openstack
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
SERVICE_TOKEN=a682f596-76f3-11e3-b3b2-e716f9080d50
LOGFILE=$DEST/logs/stack.sh.log
SCREEN_LOGDIR=$DEST/logs/screen

MULTI_HOST=True

enable_service mysql
#enable_service postgresql

HOST_IP=192.168.236.10
# Network settings
FLAT_INTERFACE=eth2
# Use VLAN to segregate the virtual networks
ENABLE_TENANT_VLANS=True
TENANT_VLAN_RANGE=1000:1999
PHYSICAL_NETWORK=physnet2
OVS_PHYSICAL_BRIDGE=br-eth2


# Branches
KEYSTONE_BRANCH=stable/icehouse
NOVA_BRANCH=stable/icehouse
NEUTRON_BRANCH=stable/icehouse
SWIFT_BRANCH=stable/icehouse
GLANCE_BRANCH=stable/icehouse
CINDER_BRANCH=stable/icehouse


disable_service n-net
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta

enable_service n-novnc
enable_service n-xvnc


Offline=True
Reclone=yes

EOF

sudo ovs-vsctl add-br br-eth2
sudo ovs-vsctl add-port br-eth2 eth2

sudo apt-get update
sudo apt-get -y upgrade

