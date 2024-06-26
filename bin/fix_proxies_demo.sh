#!/bin/bash
set -x
set -e

runenv=${RUNENV:-demo}

FRONT_END_URL=https://dvoting.fsd.team
REACT_APP_SCIPER_ADMIN=121769

# docker-compose exec backend npx cli addVoters --election-id $FORMID --scipers-file /tmp/voters.txt

# allow devlogin in order to enable the rest of the script
RANDOMIZE=false DEVLOGIN=true ./votsible.sh --demo -t dvoting.run.backend
sleep 10


curl -k "$FRONT_END_URL/api/get_dev_login/$REACT_APP_SCIPER_ADMIN" -c cookies.txt -o /dev/null -s
for i in $(seq 1 4); do
  curl -sk "$FRONT_END_URL/api/proxies/" -X POST -H 'Content-Type: application/json' -b cookies.txt --data "{\"NodeAddr\":\"https://evdemo${i}n.fsd.team:443\",\"Proxy\":\"https://evdemo${i}.fsd.team\"}"
  echo - for proxy $i
done

rm cookies.txt
sleep 5
RANDOMIZE=false DEVLOGIN=false ./votsible.sh --demo -t dvoting.run.backend
