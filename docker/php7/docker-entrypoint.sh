#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php "$@"
fi

echo "Checking Traefik"

if [ "$TRAEFIK_ENABLED" != "0" ];
then
  echo "TRAEFIK Enabled!"

  # Get Traefik IP (if existing)
  TRAEFIK_IP=`dig +short $TRAEFIK_HOST | head -n 1`

  if [ "$TRAEFIK_IP" != "" ]
  then
    export TRAEFIK_IP=$TRAEFIK_IP
    
    sed -i 's/172.16.238.10/"$TRAEFIK_IP"/' /var/www/html/config_production.php
    sed -i 's/"httpcache" => array("enabled" => true),/"httpcache" => array("enabled" => false),/' /var/www/html/config_production.php
    
  fi
fi
echo "TRAEFIK Disabled!"
exec "$@"