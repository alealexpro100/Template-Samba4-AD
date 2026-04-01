#!/bin/sh

# Posix compilant

if [ "$(id -u)" != "0" ]; then
  echo "Root user required"
  exit 1
fi

if [ "$1" = "dbcheck" ]; then
  # We can run it only from root user
  samba-tool dbcheck --cross-ncs --fix --yes
  echo "exit code $?"
fi
if [ "$1" = "ps" ]; then
    # Get samba root process id and then count childs of it
    ps -g $(ps -ax -o 'pid=,comm=' | grep samba | awk '{print $1}') | wc -l
fi
if [ "$1" = "version" ]; then
  samba-tool --version | tail -n 1
fi
if [ "$1" = "replicas" ]; then
  samba-tool drs showrepl --json
fi
if [ "$1" = "replicas_from" ]; then
  samba-tool drs showrepl --json
fi
if [ "$1" = "replicas_to" ]; then
  samba-tool drs showrepl --json
fi
if [ "$1" = "" ]; then
  echo "No param"
  exit 1
fi