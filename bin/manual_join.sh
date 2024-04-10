#!/bin/bash
set -x
set -e

basedir="/srv/dela_demo/init"
nodes="evot8 evot9 evot10 evot11"
master=evot8

ssh $master $basedir/3-setup-members.sh

for node in $nodes ; do
  ssh $node $basedir/5-authorize-identities.sh
done

ssh $master $basedir/6-update-access-contract.sh

