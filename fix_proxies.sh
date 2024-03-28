#!/bin/bash
set -x
set -e

FRONT_END_URL=https://dvoting.fsd.team
REACT_APP_SCIPER_ADMIN=121769

curl -k "$FRONT_END_URL/api/get_dev_login/$REACT_APP_SCIPER_ADMIN" -c cookies.txt -o /dev/null -s
for i in $(seq 1 4); do
  curl -sk "$FRONT_END_URL/api/proxies/" -X POST -H 'Content-Type: application/json' -b cookies.txt --data "{\"NodeAddr\":\"https://evdemo${i}n.fsd.team:443\",\"Proxy\":\"https://evdemo${i}.fsd.team\"}"
  echo - for proxy $i
done

rm cookies.txt

