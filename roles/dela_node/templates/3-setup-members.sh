#!/bin/bash
set -e
set -x

keysfile="{{ dela.init_dir }}/keys"
if [ ! -f "$keysfile" ] ; then
  echo "ids file $keysfile not found"
  exit 1
fi

MEMBERS=""
for m in $(cat "$keysfile"); do
	echo "Adding member $m"
	MEMBERS="$MEMBERS --member $m"
done
docker exec dela-worker-{{ MASTER_WORKER.node }} dvoting --config /data/node ordering setup $MEMBERS
