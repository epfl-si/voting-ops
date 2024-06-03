#!/bin/bash
set -e

help_and_exit () {
  cat >&2 <<-__HELP_MSG
    $1
    Usage:

    $0 [-h] [-m MASTER_SSH_HOST] [-r] -k ELECTION_KEY -f SCIPER_FILE_PATH

    This script adds the voters directly into the database. Therefore, the
    backend needs to be restarted in order to reload the the newly added voters.
    Use option `-r` to restart the backend. If using the script multiple time
    for several votations/voters files then it is worth passing the `-r` option
    only at the last run.
__HELP_MSG
  exit 1
}



master=evot8
restart=no

while [ "$#" -gt 0 ]; do
  case "$1" in
    -h) help_and_exit
				;;
    -k) key=$2
        shift
        ;;
    -m) master=$2
        shift
        ;;
    -f) fpath=$2
        shift
        ;;
    -r) restart="yes"
        ;;
    *)  help_and_exit "unrecognized option $1" 
		    ;;
    esac
		shift
done

[ -n "$key" ] || help_and_exit "Please provide a valid election key"
[ -n "$fpath" ] || help_and_exit "Please provide a valid sciper file path"
[ -f $fpath ] || help_and_exit "File $fpath not found"

rpath=$(ssh $master /usr/bin/mktemp)
scp $fpath $master:$rpath
cat $fpath | ssh $master docker cp $rpath backend:/tmp/voters.txt
ssh $master rm $rpath
ssh $master docker exec backend npx cli addVoters --election-id $key --scipers-file /tmp/voters.txt

if [ "$restart" == "yes" ]; then
  echo "Reloading servers to void users cache"
  ssh $master docker restart backend
  ssh $master docker restart frontend
fi
