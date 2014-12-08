#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install openvswitch-switch openvswitch-datapath-dkms git

sudo ovs-vsctl add-br br-eth2
sudo ovs-vsctl add-port br-eth2 eth2

sudo apt-get update
sudo apt-get -y upgrade



