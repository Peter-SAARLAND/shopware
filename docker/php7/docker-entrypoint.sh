#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php "$@"
fi

# Get Traefik IP (if existing)
TRAEFIK_IP=`dig +short $TRAEFIK_HOST | head -n 1`

echo $TRAEFIK_IP
if [ "$TRAEFIK_IP" != "" ]
then
  export TRAEFIK_IP=$TRAEFIK_IP
  
  sed -i 's/172.16.238.10/"$TRAEFIK_IP"/'
  sed -i 's/"httpcache" => array("enabled" => true),/"httpcache" => array("enabled" => false),/'
  
fi

exec "$@"