#!/bin/bash
set -x
set -e

FRONT_END_URL=https://voting.epfl.ch
REACT_APP_SCIPER_ADMIN=121769

# allow devlogin in order to enable the rest of the script
RANDOMIZE=false DEVLOGIN=true ./votsible.sh --prod -t dvoting.run.backend
sleep 10

curl -k "$FRONT_END_URL/api/get_dev_login/$REACT_APP_SCIPER_ADMIN" -c cookies.txt -o /dev/null -s
for i in 08 09 10 11 ; do
  curl -sk "$FRONT_END_URL/api/proxies/" -X POST -H 'Content-Type: application/json' -b cookies.txt --data "{\"NodeAddr\":\"https://nvot${i}.epfl.ch:443\",\"Proxy\":\"https://dvot${i}.epfl.ch\"}"
  echo - for proxy $i
done

rm cookies.txt
sleep 5
RANDOMIZE=false DEVLOGIN=false ./votsible.sh --prod -t dvoting.run.backend
