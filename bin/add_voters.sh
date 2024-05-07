#!/bin/bash
set -e

help_and_exit () {
  cat >&2 <<-__HELP_MSG
    $1
    Usage:

    $0 [-h] [-m MASTER_SSH_HOST] -k ELECTION_KEY -f SCIPER_FILE_PATH
__HELP_MSG
  exit 1
}



master=evot8

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
