#!/bin/bash
set -e

help_and_exit () {
  cat >&2 <<-__HELP_MSG
    $1
    Usage:

    $0 [-h] [-m MASTER_SSH_HOST] COMMANDS_AND_OPTS_FOR_BACKEND_CLI
    where available commands are

	  addAdmin -s SCIPER             Given a SCIPER number, the owner would gain
	                                 full admin permissions

	  listUserPermissions -s SCIPER  Lists the permissions -if any- of the owner of
	                                 a given SCIPER

	  removeAdmin -s SCIPER          Given a SCIPER number, the owner would lose
	                                 all admin privileges -if any-

	  keygen                         Create a new keypair for the .env

	  addVoters -e KEY -sf FILEPATH  Assigns a list of SCIPERs to an Election as
	                                 Voters. 
	                                 KEY is the election id and
	                                 FILAPATH is a line separated list of scipers
__HELP_MSG
  exit 1
}


master=evot8
declare -a cli_args
while [ "$#" -gt 0 ]; do
  case "$1" in
    -h) help_and_exit
				;;
    -m) master=$2
        shift
        ;;
    *)  cli_args+=("$1")
	    ;;
  esac
	shift
done

# call cli on the backend
ssh $master docker exec backend npx cli "${cli_args[@]}"
