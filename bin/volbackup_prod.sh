#!/bin/bash
set -e -o pipefail

volbackup() {
    h=root@evot$1
    v=$2
    ssh $h docker run --rm -v "$v:/src" -v "/tmp/bkp:/dst" busybox tar cvaf "/dst/$v.tar" -C /src .
    scp $h:/tmp/bkp/$v.tar backup/ 
}

volbackup  8 dela-worker-evprod1-data
volbackup  9 dela-worker-evprod2-data
volbackup 10 dela-worker-evprod3-data
volbackup 11 dela-worker-evprod4-data
volbackup  8 dvoting-prod-dbdata 
volbackup  8 dvoting-prod-bedata 
