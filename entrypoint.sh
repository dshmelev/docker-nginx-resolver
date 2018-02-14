#!/bin/bash
if [ "$NAMESERVER" == "" ]; then
	export NAMESERVER=`cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' '`
fi

if ! [[ -z ${RESOLVER_FILEPATH} ]]; then
  echo "Nameserver is: $NAMESERVER; Filepath is: $RESOLVER_FILEPATH;"
  echo "resolver $NAMESERVER $RESOLVER_PARAMS;" > $RESOLVER_FILEPATH
fi

# default behaviour is to launch nginx
if [[ -z ${1} ]]; then
  echo "Starting nginx..."
  exec $(which nginx) -g "daemon off;"
else
  exec "$@"
fi
