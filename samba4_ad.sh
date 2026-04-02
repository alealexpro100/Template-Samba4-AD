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
  ps -ax -o 'pid=,args=' | grep '\/\(samba\|smbd\|nmbd\|winbindd\)' | wc -l
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