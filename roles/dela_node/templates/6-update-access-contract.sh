#!/bin/bash
set -e
set -x

idsfile="{{ dela.init_dir }}/ids"
if [ ! -f "$idsfile" ] ; then
  echo "ids file $idsfile not found"
  exit 1
fi

for id in $(cat "$idsfile"); do
  docker exec dela-worker-{{ MASTER_WORKER.node }} dvoting --config /data/node pool add\
      --key /data/node/private.key\
      --args go.dedis.ch/dela.ContractArg\
      --args go.dedis.ch/dela.Access\
      --args access:grant_id\
      --args {{ dela.grant_id }}\
      --args access:grant_contract\
      --args go.dedis.ch/dela.Evoting \
      --args access:grant_command\
      --args all\
      --args access:identity\
      --args $id\
      --args access:command\
      --args GRANT
done
