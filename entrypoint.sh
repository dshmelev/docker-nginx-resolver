#!/bin/bash
if [ "$NAMESERVER" == "" ]; then
	export NAMESERVER=`cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' '`
fi

echo "Nameserver is: $NAMESERVER"
echo "resolver $NAMESERVER $RESOLVER_PARAMS;" > /etc/nginx/resolver.conf

# default behaviour is to launch nginx
if [[ -z ${1} ]]; then
  echo "Starting nginx..."
  exec $(which nginx) -g "daemon off;"
else
  exec "$@"
fi
