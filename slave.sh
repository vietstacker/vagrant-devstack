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

# replace this with the IP address of the compute node

HOST_IP=192.168.236.11 

# Openstack services running on controller node

# replace this with the IP address of the controller node
SERVICE_HOST=192.168.236.10 
MYSQL_HOST=$SERVICE_HOST
RABBIT_HOST=$SERVICE_HOST
Q_HOST=$SERVICE_HOST
GLANCE_HOSTPORT=$SERVICE_HOST:9292


# Branches
KEYSTONE_BRANCH=stable/icehouse
NOVA_BRANCH=stable/icehouse
NEUTRON_BRANCH=stable/icehouse
SWIFT_BRANCH=stable/icehouse
GLANCE_BRANCH=stable/icehouse
CINDER_BRANCH=stable/icehouse




ENABLED_SERVICES=n-cpu,rabbit,quantum,q-agt

Offline=True
Reclone=no


sudo ovs-vsctl add-br br-eth2
sudo ovs-vsctl add-port br-eth2 eth2

sudo apt-get update
sudo apt-get -y upgrade

