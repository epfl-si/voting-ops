#!/bin/bash
set -e

idsfile="{{ dela.init_dir }}/ids"
if [ ! -f "$idsfile" ] ; then
  echo "ids file $idsfile not found"
  exit 1
fi
for id in $(cat "$idsfile"); do
  echo "ID is: $id"
  for node in {{ dela.nodes | map(attribute='name') | join(' ') }} ; do
    docker exec dela-worker-$node dvoting --config /data/node access add --identity "$id"
  done
done
