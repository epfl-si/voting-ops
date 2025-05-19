#!/bin/bash
set -x
set -e

runenv=${RUNENV:-demo}

if [ "$runenv" == "prod" ]; then
	ssh evot8  docker stop dela-worker-ev${runenv}1 backend frontend postgres
	ssh evot9  docker stop dela-worker-ev${runenv}2
	ssh evot10 docker stop dela-worker-ev${runenv}3
	ssh evot11 docker stop dela-worker-ev${runenv}4

	ssh evot8  docker run -v dela-worker-ev${runenv}1-data:/data busybox rm -rf /data/node
	ssh evot9  docker run -v dela-worker-ev${runenv}2-data:/data busybox rm -rf /data/node
	ssh evot10 docker run -v dela-worker-ev${runenv}3-data:/data busybox rm -rf /data/node
	ssh evot11 docker run -v dela-worker-ev${runenv}4-data:/data busybox rm -rf /data/node

	ssh evot8  docker run -v dvoting-${runenv}-dbdata:/data busybox rm -rf /data/*

	ssh evot8  sudo rm -f /srv/dela_${runenv}/init/ids /srv/dela_${runenv}/init/keys


elif [ "$runenv" == "demo" ] ; then
	ssh evot3  docker stop dela-worker-ev${runenv}1 backend frontend postgres
	ssh evot4  docker stop dela-worker-ev${runenv}2
	ssh evot5  docker stop dela-worker-ev${runenv}3
	ssh evot6  docker stop dela-worker-ev${runenv}4

	ssh evot3  docker run -v dela-worker-ev${runenv}1-data:/data busybox rm -rf /data/node
	ssh evot4  docker run -v dela-worker-ev${runenv}2-data:/data busybox rm -rf /data/node
	ssh evot5 docker run -v dela-worker-ev${runenv}3-data:/data busybox rm -rf /data/node
	ssh evot6 docker run -v dela-worker-ev${runenv}4-data:/data busybox rm -rf /data/node

	ssh evot3 docker run -v dvoting-${runenv}-dbdata:/data busybox rm -rf /data/*
	ssh evot3 sudo rm -f /srv/dela_${runenv}/init/ids /srv/dela_${runenv}/init/keys
fi

echo "Data cleared. Remember to"
echo "./votsible.sh --${runenv} -t dela.run"
echo "./votsible.sh --${runenv} -t dvoting.run"
