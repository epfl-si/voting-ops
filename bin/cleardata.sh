#!/bin/bash
set -x
set -e

ssh evot8  docker stop dela-worker-evdemo1 backend frontend postgres
ssh evot9  docker stop dela-worker-evdemo2
ssh evot10 docker stop dela-worker-evdemo3
ssh evot11 docker stop dela-worker-evdemo4

ssh evot8  docker run -it -v dela-worker-evdemo1-data:/data busybox rm -rf /data/node
ssh evot9  docker run -it -v dela-worker-evdemo2-data:/data busybox rm -rf /data/node
ssh evot10 docker run -it -v dela-worker-evdemo3-data:/data busybox rm -rf /data/node
ssh evot11 docker run -it -v dela-worker-evdemo4-data:/data busybox rm -rf /data/node

docker run -it -v dvoting-database-data:/data busybox rm -rf /data/*

