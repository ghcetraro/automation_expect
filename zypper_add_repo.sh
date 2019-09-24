#!/bin/bash

REPO=$1
#REPO='https://download.opensuse.org/repositories/Virtualization:containers/SLE_12_SP3/Virtualization:containers.repo'
SOFT$2
#SOFT='docker'

#configure proxy
export https_proxy=http://proxy.domain:80

zypper addrepo $REPO

./zypper_refresh.sh

zypper install $SOFT
