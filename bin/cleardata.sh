#!/bin/bash
set -x
set -e

runenv=${RUNENV:-demo}

ssh evot8  docker stop dela-worker-ev${runenv}1 backend frontend postgres
ssh evot9  docker stop dela-worker-ev${runenv}2
ssh evot10 docker stop dela-worker-ev${runenv}3
ssh evot11 docker stop dela-worker-ev${runenv}4

ssh evot8  docker run -v dela-worker-ev${runenv}1-data:/data busybox rm -rf /data/node
ssh evot9  docker run -v dela-worker-ev${runenv}2-data:/data busybox rm -rf /data/node
ssh evot10 docker run -v dela-worker-ev${runenv}3-data:/data busybox rm -rf /data/node
ssh evot11 docker run -v dela-worker-ev${runenv}4-data:/data busybox rm -rf /data/node

docker run -v dvoting-${runenv}-dbdata:/data busybox rm -rf /data/*

ssh evot8 sudo rm -f /srv/dela_${runenv}/init/ids /srv/dela_${runenv}/init/keys
